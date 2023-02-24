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

  Future<void> _fetchPage(int pageKey) async {
    final result = await productsRepo.list(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if(searchTerm.isNotEmpty)
        'title': searchTerm,
      },
    );
    result.fold((l) {
      final isLastPage = l.products!.length < _pageSize;
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
}
