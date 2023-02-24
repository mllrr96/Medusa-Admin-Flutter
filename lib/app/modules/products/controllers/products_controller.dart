import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/models/store/product.dart';

class ProductsController extends GetxController {
  static ProductsController instance = Get.find<ProductsController>();

  ProductsController({required this.productsRepo});
  ProductsRepo productsRepo;
  final PagingController<int, Product> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  String searchTerm = '';
  ViewOptions viewOptions = ViewOptions.list;
  RefreshController gridRefreshController = RefreshController();
  RefreshController listRefreshController = RefreshController();
  RxInt productsCount = 0.obs;
  Rx<SortOptions> sortOptions = SortOptions.dateRecent.obs;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeViewOption() {
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
    final result = await productsRepo.list(
      queryParams: {
        if (searchTerm.isNotEmpty) 'fields': 'id,title,thumbnail,status,handle,collection_id',
        if (searchTerm.isNotEmpty)
          'expand': 'variants,options,variants.prices,variants.options,collection,tags,type,images,sales_channels',
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if (searchTerm.isNotEmpty) 'q': searchTerm,
        'order': _getSortOption(),
      },
    );
    result.fold((l) {
      final isLastPage = l.products!.length < _pageSize;
      productsCount.value = l.count ?? 0;
      update([5]);
      if (isLastPage) {
        pagingController.appendLastPage(l.products!);
      } else {
        final nextPageKey = pageKey + l.products!.length;
        pagingController.appendPage(l.products!, nextPageKey);
      }
      gridRefreshController.refreshCompleted();
      listRefreshController.refreshCompleted();
    }, (r) {
      pagingController.error = r.getMessage();
      gridRefreshController.refreshFailed();
      listRefreshController.refreshFailed();
    });
  }

  Future<void> deleteProduct(String id) async {
    loading();
    final result = await productsRepo.delete(id: id);
    result.fold((l) {
      if (l.deleted != null && l.deleted!) {
        // product deleted
        EasyLoading.showSuccess('Product Deleted');
        pagingController.refresh();
      } else {
        EasyLoading.showError('Deletion failed');
      }
    }, (r) {
      // Error deleting product
      EasyLoading.showError('Deletion failed');
    });
  }

  Future<void> updateProduct(Product product) async {
    loading();
    final result = await productsRepo.update(product: product);
    result.fold((l) {
      if (l.product != null) {
        EasyLoading.showSuccess('Product updated');
        pagingController.refresh();
      } else {
        EasyLoading.showError('Update failed');
      }
    }, (r) {
      // Error deleting product
      EasyLoading.showError('Update failed');
    });
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
