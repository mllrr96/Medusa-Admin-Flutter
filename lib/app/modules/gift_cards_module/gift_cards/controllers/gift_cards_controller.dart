import 'dart:async';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

class GiftCardsController extends GetxController {
  static GiftCardsController get instance => Get.find<GiftCardsController>();

  GiftCardsController({ required this.productsRepo});
  final ProductsRepo productsRepo;
  final productsPagingController = PagingController<int, Product>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;

  @override
  void onInit() {
    productsPagingController.addPageRequestListener((pageKey) => _fetchProductGiftCards(pageKey));
    super.onInit();
  }


  Future<void> _fetchProductGiftCards(int pageKey) async {
    final result = await productsRepo.retrieveAll(queryParams: {
      'is_giftcard': true,
    });
    result.when((success) {
      if (success.products == null) {
        productsPagingController.error = 'Error loading gift cards, received null value';
        return;
      }
      final isLastPage = success.products!.length < _pageSize;
      if (isLastPage) {
        productsPagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        productsPagingController.appendPage(success.products!, nextPageKey);
      }
      // refreshController.refreshCompleted();
    }, (error) {
      productsPagingController.error = 'Error loading gift cards';
      // refreshController.refreshFailed();
    });
  }
}
