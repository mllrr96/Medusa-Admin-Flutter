import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

import '../controllers/medusa_search_controller.dart';


class SearchBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SearchController>(
    //   () => SearchController(),
    // );
    Get.put(MedusaSearchController(productsRepo: ProductsRepo()));
  }
}
