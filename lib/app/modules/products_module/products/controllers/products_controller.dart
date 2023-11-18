import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/products_module/products/components/products_filter_view.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../data/repository/product_tag/product_tag_repo.dart';

class ProductsController extends GetxController with GetSingleTickerProviderStateMixin {
  static ProductsController get instance => Get.find<ProductsController>();

  ProductsController({required this.productsRepo, required this.productTagRepo, required this.collectionRepo});
  ProductsRepo productsRepo;
  ProductTagRepo productTagRepo;
  CollectionRepo collectionRepo;
  final pagingController = PagingController<int, Product>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  ViewOptions viewOptions = ViewOptions.list;
  RefreshController gridRefreshController = RefreshController();
  RefreshController listRefreshController = RefreshController();
  RxInt productsCount = 0.obs;
  SortOptions sortOptions = SortOptions.dateRecent;
  late TabController tabController;
  final searchCtrl = TextEditingController();
  RxString searchTerm = ''.obs;
  late Worker searchDebouner;
  List<ProductTag>? tags;
  List<ProductCollection>? collections;
  ProductFilter? productFilter;
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
  Future<void> onReady() async {
    await loadTags();
    await loadCollections();
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    searchDebouner.dispose();
    super.onClose();
  }

  void changeSortOption(SortOptions sortOption) {
    sortOptions = sortOption;
    update();
    pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    Map<String, dynamic> query = {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      if (searchTerm.value.isNotEmpty) 'q': searchTerm.value,
      'order': sortOptions.map(),
      'is_giftcard': 'false',
    };

    final result = await productsRepo.retrieveAll(
        queryParameters: query..addAll(searchTerm.value.isEmpty ? productFilter?.toJson() ?? {} : {}));
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

  Future<void> loadTags() async {
    final result = await productTagRepo.retrieveProductTags();
    result.when((success) {
      if (success.tags?.isNotEmpty ?? false) {
        tags = success.tags!;
      }
    }, (error) {});
  }

  Future<void> loadCollections() async {
    final result = await collectionRepo.retrieveAll();
    result.when((success) {
      if (success.collections?.isNotEmpty ?? false) {
        collections = success.collections!;
      }
    }, (error) {});
  }

  Future<void> duplicateProduct(Product product) async {
    final result = await productsRepo.add(userPostProductReq: UserPostProductReq(product: product.duplicate()));
    result.when((success) {
      EasyLoading.showSuccess('Product duplicated');
      pagingController.refresh();
    }, (error) {
      print(error.toString());
       EasyLoading.showError('Error duplicating product');
    });
  }
}
