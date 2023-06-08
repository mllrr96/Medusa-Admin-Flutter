import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/product_category/product_category_repo.dart';

import '../controllers/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController(categoryRepo: ProductCategoryRepo()));
  }
}
