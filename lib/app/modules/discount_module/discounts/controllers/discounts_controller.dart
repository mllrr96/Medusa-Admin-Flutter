import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';

class DiscountsController extends GetxController {
  DiscountsController({required this.discountRepo});
  final DiscountRepo discountRepo;

  final PagingController<int, Discount> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  final int _pageSize = 20;

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
      final isLastPage = success.discounts!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.discounts!);
      } else {
        final nextPageKey = pageKey + success.discounts!.length;
        pagingController.appendPage(success.discounts!, nextPageKey);
      }
    }, (error) {
      pagingController.error = 'Error loading discount';
    });
  }
}
