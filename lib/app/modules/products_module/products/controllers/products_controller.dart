import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/models/store/product.dart';

class ProductsController extends GetxController with GetSingleTickerProviderStateMixin {
  static ProductsController get instance => Get.find<ProductsController>();

  ProductsController({required this.productsRepo});
  ProductsRepo productsRepo;
  final pagingController = PagingController<int, Product>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  ViewOptions viewOptions = ViewOptions.list;
  RefreshController gridRefreshController = RefreshController();
  RefreshController listRefreshController = RefreshController();
  RxInt productsCount = 0.obs;
  Rx<SortOptions> sortOptions = SortOptions.dateRecent.obs;
  late TabController tabController;
  final searchCtrl = TextEditingController();
  RxString searchTerm = ''.obs;
  late Worker searchDebouner;
  @override
  void onInit() {
    searchDebouner =
        debounce(searchTerm, (callback) => pagingController.refresh(), time: const Duration(milliseconds: 300));
    tabController = TabController(length: 2, vsync: this);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    searchDebouner.dispose();
    super.onClose();
  }

  void changeViewOption({ViewOptions? option}) {
    if (option != null && option != viewOptions) {
      viewOptions = option;
      update();
      return;
    }

    switch (viewOptions) {
      case ViewOptions.list:
        viewOptions = ViewOptions.grid;
        break;
      case ViewOptions.grid:
        viewOptions = ViewOptions.list;
        break;
    }
    update();
  }

  void changeSortOption(SortOptions sortOption) {
    switch (sortOption) {
      case SortOptions.aZ:
        sortOptions.value = SortOptions.aZ;
        break;
      case SortOptions.zA:
        sortOptions.value = SortOptions.zA;
        break;
      case SortOptions.dateRecent:
        sortOptions.value = SortOptions.dateRecent;
        break;
      case SortOptions.dateOld:
        sortOptions.value = SortOptions.dateOld;
        break;
    }
    pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await productsRepo.retrieveAll(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if (searchTerm.value.isNotEmpty) 'q': searchTerm.value,
        'order': _getSortOption(),
        'is_giftcard': 'false',
      },
    );

    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      if (searchTerm.value.isEmpty) {
        productsCount.value = success.count ?? 0;
      }
      update([5]);
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }
      gridRefreshController.refreshCompleted();
      listRefreshController.refreshCompleted();
    }, (error) {
      pagingController.error = error.message;
      gridRefreshController.refreshFailed();
      listRefreshController.refreshFailed();
    });
  }

  Future<void> deleteProduct(String id) async {
    loading();
    final result = await productsRepo.delete(id: id);
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
    final result = await productsRepo.update(
      id: product.id!,
      userPostUpdateProductReq: UserPostUpdateProductReq(
        discountable: product.discountable,
        status: product.status == ProductStatus.published ? ProductStatus.draft : ProductStatus.published,
      ),
    );
    result.when((success) {
      if (success.product != null) {
        EasyLoading.showSuccess('Product updated');
        pagingController.refresh();
      } else {
        EasyLoading.showError('Update failed');
      }
    }, (error) => EasyLoading.showError('Update failed'));
  }

  String _getSortOption() {
    String sortOption = 'created_at';
    switch (sortOptions.value) {
      case SortOptions.aZ:
        sortOption = 'title';
        break;
      case SortOptions.zA:
        sortOption = '-title';
        break;
      case SortOptions.dateRecent:
        sortOption = 'created_at';
        break;
      case SortOptions.dateOld:
        sortOption = '-created_at';
        break;
    }
    return sortOption;
  }
}
