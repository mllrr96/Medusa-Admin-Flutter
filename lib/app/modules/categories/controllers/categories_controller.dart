import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoriesController extends GetxController {
  CategoriesController({required this.categoryRepo});
  static CategoriesController get instance => Get.find<CategoriesController>();

  final ProductCategoryRepository categoryRepo;
  final refreshController = RefreshController();
  final int _pageSize = 20;
  final PagingController<int, ProductCategory> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  RxInt categoriesCount = 0.obs;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final result =
          await categoryRepo.retrieveProductCategories(queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      });

      if (result != null) {
        final isLastPage = result.productCategories!.length < _pageSize;
        categoriesCount.value = result.count ?? 0;
        if (isLastPage) {
          pagingController.appendLastPage(result.productCategories!);
        } else {
          final nextPageKey = pageKey + result.productCategories!.length;
          pagingController.appendPage(result.productCategories!, nextPageKey);
        }
        refreshController.refreshCompleted();
      }
    } catch (error) {
      refreshController.refreshFailed();
      pagingController.error = error;
    }
  }
}
