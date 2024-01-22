import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/use_case/group/groups_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GroupsController extends GetxController {
  static GroupsController get instance => Get.find<GroupsController>();
  GroupsController({required this.groupsUseCase});

  final GroupsUseCase groupsUseCase;
  final PagingController<int, CustomerGroup> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  RefreshController refreshController = RefreshController();
  final int _pageSize = 20;
  final scrollController = ScrollController();
  RxInt customerGroupsCount = 0.obs;
  bool _refreshingData = false;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (_refreshingData) {
      return;
    }
    final result = await groupsUseCase.retrieveCustomerGroups(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'customers',
    });
    result.when((success) {
      final isLastPage = success.customerGroups!.length < _pageSize;
      customerGroupsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.customerGroups!);
      } else {
        final nextPageKey = pageKey + success.customerGroups!.length;
        pagingController.appendPage(success.customerGroups!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = error;
      refreshController.refreshFailed();
    });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    final result = await groupsUseCase.retrieveCustomerGroups(queryParameters: {
      'offset': 0,
      'limit': _pageSize,
      'expand': 'customers',
    });
    result.when((success) async {
      final isLastPage = success.customerGroups!.length < _pageSize;
      customerGroupsCount.value = success.count ?? 0;
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.customerGroups!);
      } else {
        pagingController.appendPage(
            success.customerGroups!, success.customerGroups!.length);
      }
      refreshController.refreshCompleted();
    }, (error) async {
      refreshController.refreshFailed();
      Fluttertoast.showToast(msg: 'Error refreshing data');
      if (error.code == 401) {
        await getIt<AppRouter>().reevaluateGuards();
      }
    });
    _refreshingData = false;
  }

  Future<void> deleteGroup({required String id}) async {
    loading();
    final result = await groupsUseCase.deleteCustomerGroup(id: id);
    result.when((success) {
      pagingController.refresh();
      Get.snackbar('Success', 'Customer Group deleted',
          snackPosition: SnackPosition.BOTTOM);
    }, (error) => Get.snackbar('Failure, ${error.code ?? ''}', error.message));

    dismissLoading();
  }
}
