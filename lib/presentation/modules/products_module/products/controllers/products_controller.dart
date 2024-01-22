import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/modules/products_module/products/components/products_filter_view.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/domain/use_case/product/products_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find<ProductsController>();

  ProductsController({required this.productsUseCase});
  final ProductsUseCase productsUseCase;
  final pagingController = PagingController<int, Product>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  RefreshController refreshController = RefreshController();
  RxInt productsCount = 0.obs;
  SortOptions sortOptions = SortOptions.dateRecent;
  ProductFilter? productFilter;
  bool _refreshingData = false;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  void changeSortOption(SortOptions sortOption) {
    sortOptions = sortOption;
    update();
    pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (_refreshingData) {
      return;
    }
    Map<String, dynamic> query = {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'order': sortOptions.map(),
      'is_giftcard': 'false',
    };

    final result = await productsUseCase.fetchProducts(
        queryParameters: query..addAll(productFilter?.toJson() ?? {}));
    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      productsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = error;
      refreshController.refreshFailed();
    });
  }

  Future<void> deleteProduct(String id) async {
    loading();
    final result = await productsUseCase.delete(id: id);
    result.when((success) {
      if (success.deleted != null && success.deleted!) {
        // product deleted
        EasyLoading.showSuccess('Product Deleted');
        pagingController.refresh();
      } else {
        EasyLoading.showError('Deletion failed');
      }
    }, (error) => EasyLoading.showError('Deletion failed'));
  }

  Future<void> updateProduct(Product product) async {
    loading();
    final result = await productsUseCase.update(
      id: product.id!,
      userPostUpdateProductReq: UserPostUpdateProductReq(
        discountable: product.discountable,
        status: product.status == ProductStatus.published
            ? ProductStatus.draft
            : ProductStatus.published,
      ),
    );
    result.when((success) {
      EasyLoading.showSuccess('Product updated');
      pagingController.refresh();
    }, (error) => EasyLoading.showError('Update failed'));
  }

  void resetFilter() {
    if (productFilter == null || productFilter?.count() == 0) {
      return;
    }
    productFilter = null;
    pagingController.refresh();
    update();
  }

  void updateFilter(ProductFilter productFilter) {
    this.productFilter = productFilter;
    pagingController.refresh();
    update();
  }

  Future<void> duplicateProduct(Product product) async {
    // final result = await productsRepo.add(
    //     userPostProductReq: UserPostProductReq(product: product.duplicate()));
    // result.when((success) {
    //   EasyLoading.showSuccess('Product duplicated');
    //   pagingController.refresh();
    // }, (error) {
    //   EasyLoading.showError('Error duplicating product');
    // });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    Map<String, dynamic> query = {
      'offset': 0,
      'limit': _pageSize,
      'order': sortOptions.map(),
      'is_giftcard': 'false',
    };

    final result = await productsUseCase.fetchProducts(
        queryParameters: query..addAll(productFilter?.toJson() ?? {}));
    await result.when((success) async {
      final isLastPage = success.products!.length < _pageSize;
      productsCount.value = success.count ?? 0;
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        pagingController.appendPage(
            success.products!, success.products!.length);
      }
      refreshController.refreshCompleted();
    }, (error) {
      refreshController.refreshFailed();
      Fluttertoast.showToast(msg: "Error refreshing data");
    });
    _refreshingData = false;
  }
}
