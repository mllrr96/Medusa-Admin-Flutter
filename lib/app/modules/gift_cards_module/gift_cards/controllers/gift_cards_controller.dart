import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class GiftCardsController extends GetxController {
  static GiftCardsController get instance => Get.find<GiftCardsController>();

  GiftCardsController({required this.productsRepo});
  final ProductsRepo productsRepo;
  final productsPagingController = PagingController<int, Product>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final scrollController = ScrollController();
  @override
  void onInit() {
    productsPagingController.addPageRequestListener((pageKey) => _fetchProductGiftCards(pageKey));
    super.onInit();
  }


  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
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
    }, (error) {
      productsPagingController.error = 'Error loading gift cards';
    });
  }

  Future<void> deleteProduct(String id) async {
    loading();
    final result = await productsRepo.delete(id: id);
    result.when((success) {
      EasyLoading.showSuccess('Gift card deleted');
      productsPagingController.refresh();
      return;
    }, (error) {
      Get.snackbar('Error deleting gift card ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
    });
    dismissLoading();
  }

  Future<void> toggleProduct(Product product) async {
    loading();
    final result = await productsRepo.update(
        userPostUpdateProductReq: UserPostUpdateProductReq(
            status: product.status == ProductStatus.published ? ProductStatus.draft : ProductStatus.published),
        id: product.id!);
    result.when((success) {
      EasyLoading.showSuccess('Gift card updated');
      productsPagingController.refresh();
      return;
    }, (error) {
      Get.snackbar('Error updating gift card ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
    });
    dismissLoading();
  }
}
