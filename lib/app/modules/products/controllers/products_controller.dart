import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/models/store/product.dart';

class ProductsController extends GetxController {
  ProductsController({required this.productsRepository});
  ProductsRepo productsRepository;
  final PagingController<int, Product> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  ViewOptions viewOptions = ViewOptions.list;
  RefreshController refreshController = RefreshController();

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
    try {
      final productRes = await productsRepository
          .list(queryParams: {'offset': pagingController.itemList?.length ?? 0, 'limit': _pageSize});
      final isLastPage = productRes!.products!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(productRes.products!);
      } else {
        final nextPageKey = pageKey + productRes.products!.length;
        pagingController.appendPage(productRes.products!, nextPageKey);
      }
      refreshController.refreshCompleted();
    } catch (error) {
      pagingController.error = error;
      refreshController.refreshFailed();
    }
  }
}
