import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/models/req/discount.dart';

class DiscountsController extends GetxController {
  static final DiscountsController instance = Get.find<DiscountsController>();
  DiscountsController({required this.discountRepo});
  final DiscountRepo discountRepo;

  final PagingController<int, Discount> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  final int _pageSize = 20;
  final refreshController = RefreshController();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await discountRepo.retrieveDiscounts(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });
    result.when((success) {
      refreshController.refreshCompleted();
      final isLastPage = success.discounts!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.discounts!);
      } else {
        final nextPageKey = pageKey + success.discounts!.length;
        pagingController.appendPage(success.discounts!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
      refreshController.refreshFailed();
    });
  }

  Future<void> toggleDiscount({required Discount discount}) async {
    loading();
    bool toggle = discount.isDisabled != null && discount.isDisabled! ? false : true;
    final result = await discountRepo.updateDiscount(
        id: discount.id!, userUpdateDiscountReq: UserUpdateDiscountReq(isDisabled: toggle));

    result.when((success) => pagingController.refresh(),
        (error) => Get.snackbar('Error ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> deleteDiscount({required String id}) async {
    loading();
    final result = await discountRepo.deleteDiscount(id: id);
    result.when((success) {
      Get.snackbar('Success', 'Promotion deleted successfully', snackPosition: SnackPosition.BOTTOM);
      pagingController.refresh();
    },
        (error) => Get.snackbar('Error deleting promotion ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }
}
