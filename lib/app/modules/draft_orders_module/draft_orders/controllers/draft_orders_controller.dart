import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/drafts_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DraftOrdersController extends GetxController {
  static DraftOrdersController get instance =>
      Get.find<DraftOrdersController>();
  DraftOrdersController({required this.draftsUseCase});
  final DraftsUseCase draftsUseCase;
  final int _pageSize = 20;
  RxInt draftOrdersCount = 0.obs;
  bool _refreshingData = false;
  RefreshController refreshController = RefreshController();
  final PagingController<int, DraftOrder> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final scrollController = ScrollController();
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if(_refreshingData){
      return;
    }
    final result = await draftsUseCase(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });
    result.when((success) {
      final isLastPage = success.draftOrders!.length < _pageSize;
      draftOrdersCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.draftOrders!);
      } else {
        final nextPageKey = pageKey + success.draftOrders!.length;
        pagingController.appendPage(success.draftOrders!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error;
    });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    final result = await draftsUseCase(queryParameters: {
      'offset':  0,
      'limit': _pageSize,
    });
   await result.when((success) async {
      final isLastPage = success.draftOrders!.length < _pageSize;
      draftOrdersCount.value = success.count ?? 0;
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.draftOrders!);
      } else {
        pagingController.appendPage(
            success.draftOrders!, success.draftOrders!.length);
      }
      refreshController.refreshCompleted();
    }, (error) {
      Fluttertoast.showToast(msg: "Error refreshing data");
      refreshController.refreshFailed();
    });
    _refreshingData = false;
  }
}
