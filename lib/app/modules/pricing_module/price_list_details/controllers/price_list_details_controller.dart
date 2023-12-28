import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/req/user_price_list_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/pricing_module/pricing/controllers/pricing_controller.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

class PriceListDetailsController extends GetxController
    with StateMixin<PriceList> {
  PriceListDetailsController({required this.priceListRepo, required this.id});
  final PriceListRepo priceListRepo;
  final String id;
  final pagingController = PagingController<int, Product>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  @override
  Future<void> onInit() async {
    await fetchPriceList();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> deletePriceList(BuildContext context) async {
    loading();
    final result = await priceListRepo.deletePriceList(id: id);

    result.when(
      (success) {
        if (success.deleted) {
          EasyLoading.showSuccess('Price list deleted');
          PricingController.instance.pagingController.refresh();
          context.popRoute();
        } else {
          Get.snackbar('Error deleting price list', 'Unknown error',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
      (error) => Get.snackbar(
          'Error deleting price list ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM),
    );
  }

  Future<void> fetchPriceList() async {
    change(null, status: RxStatus.loading());
    final result = await priceListRepo.retrievePriceList(id: id);
    result.when(
        (success) => change(success.priceList!, status: RxStatus.success()),
        (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await priceListRepo.retrievePriceListProducts(
      id: id,
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'expand': 'variants,collection',
      },
    );

    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      update([5]);
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
    });
  }

  Future<void> deleteProduct(BuildContext context, Product product) async {
    loading();
    final result =
        await priceListRepo.deleteProductPrices(id: id, productId: product.id!);
    result.when((success) {
      success.deleted
          ? EasyLoading.showSuccess('Product deleted')
          : context.showSnackBar('Error deleting product, Unknown error');
    }, (error) {
      dismissLoading();
      context
          .showSnackBar('Error deleting product, ${error.toSnackBarString()}');
      pagingController.refresh();
    });
  }

  Future<void> updatePrices(
      BuildContext context, List<MoneyAmount> prices) async {
    loading();
    final result = await priceListRepo.updatePrices(
        id: id,
        userUpdatePricesReq: UserUpdatePricesReq(
            prices: prices
                .map((e) => MoneyAmount(
                    variantId: e.variantId,
                    amount: e.amount,
                    currencyCode: e.currencyCode))
                .toList()));
    result.when((success) async {
      context.showSnackBar('Prices updated');
      dismissLoading();
      if (success.priceList != null) {
        change(success.priceList, status: RxStatus.success());
      } else {
        await fetchPriceList();
      }
    }, (error) {
      dismissLoading();
      context
          .showSnackBar('Error updating prices, ${error.toSnackBarString()}');
    });
  }
}
