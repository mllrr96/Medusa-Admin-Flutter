import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/product_category.dart';
import 'package:medusa_admin/app/data/repository/product_category/product_category_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoriesController extends GetxController {
  CategoriesController({required this.categoryRepo});
  static CategoriesController get instance => Get.find<CategoriesController>();

  final ProductCategoryRepo categoryRepo;
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
    final result =
        await categoryRepo.retrieveProductCategories(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });
    result.when((success) {
      final isLastPage = success.productCategories!.length < _pageSize;
      categoriesCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.productCategories!);
      } else {
        final nextPageKey = pageKey + success.productCategories!.length;
        pagingController.appendPage(success.productCategories!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      refreshController.refreshFailed();
      pagingController.error = error;
    });
  }
}
