import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/use_case/customer/customer_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomersController extends GetxController {
  static CustomersController get instance => Get.find<CustomersController>();
  CustomersController({required this.customerUseCase});
  final CustomerUseCase customerUseCase;

  RefreshController refreshController = RefreshController();
  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final scrollController = ScrollController();
  final int _pageSize = 20;
  RxInt customersCount = 0.obs;
  bool _refreshingData = false;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (_refreshingData) {
      return;
    }
    final result = await customerUseCase.retrieveCustomers(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'orders',
    });
    result.when((success) {
      final isLastPage = success.customers!.length < _pageSize;
      customersCount.value = success.count ?? 0;

      if (isLastPage) {
        pagingController.appendLastPage(success.customers!);
      } else {
        final nextPageKey = pageKey + success.customers!.length;
        pagingController.appendPage(success.customers!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      refreshController.refreshFailed();
      pagingController.error = error;
    });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    final result = await customerUseCase.retrieveCustomers(queryParameters: {
      'offset': 0,
      'limit': _pageSize,
      'expand': 'orders',
    });
    await result.when((success) async {
      final isLastPage = success.customers!.length < _pageSize;
      customersCount.value = success.count ?? 0;
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.customers!);
      } else {
        pagingController.appendPage(
            success.customers!, success.customers!.length);
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
}
