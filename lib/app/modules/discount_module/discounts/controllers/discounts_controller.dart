import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/models/req/discount.dart';

class DiscountsController extends GetxController {
  static DiscountsController get instance => Get.find<DiscountsController>();
  DiscountsController({required this.discountRepo});
  final DiscountRepo discountRepo;

  final PagingController<int, Discount> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  final int _pageSize = 20;
  final refreshController = RefreshController();
  final scrollController = ScrollController();
  bool _refreshingData = false;
  RxInt discountsCount = 0.obs;

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
    if (_refreshingData) {
      return;
    }
    final result = await discountRepo.retrieveDiscounts(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'is_dynamic': false,
    });
    result.when((success) {
      final isLastPage = success.discounts!.length < _pageSize;
      discountsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.discounts!);
      } else {
        final nextPageKey = pageKey + success.discounts!.length;
        pagingController.appendPage(success.discounts!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = error;
      refreshController.refreshFailed();
    });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    final result = await discountRepo.retrieveDiscounts(queryParameters: {
      'offset': 0,
      'limit': _pageSize,
      'is_dynamic': false,
    });
    await result.when((success) async {
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      final isLastPage = success.discounts!.length < _pageSize;
      discountsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.discounts!);
      } else {
        pagingController.appendPage(
            success.discounts!, success.discounts!.length);
      }
      refreshController.refreshCompleted();
    }, (_) {
      refreshController.refreshFailed();
      Fluttertoast.showToast(msg: 'Error refreshing data');
    });
    _refreshingData = false;
  }

  Future<void> toggleDiscount({required Discount discount}) async {
    loading();
    bool toggle =
        discount.isDisabled != null && discount.isDisabled! ? false : true;
    final result = await discountRepo.updateDiscount(
        id: discount.id!,
        userUpdateDiscountReq: UserUpdateDiscountReq(isDisabled: toggle));

    result.when(
        (success) => pagingController.refresh(),
        (error) => Get.snackbar('Error ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> deleteDiscount({required String id}) async {
    loading();
    final result = await discountRepo.deleteDiscount(id: id);
    result.when((success) {
      Get.snackbar('Success', 'Promotion deleted successfully',
          snackPosition: SnackPosition.BOTTOM);
      pagingController.refresh();
    },
        (error) => Get.snackbar(
            'Error deleting promotion ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }
}
