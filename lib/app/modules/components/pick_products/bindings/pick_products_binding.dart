import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

import '../controllers/pick_products_controller.dart';

class PickProductsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<PickProductsController>(() => PickProductsController(productsRepo: ProductsRepo()));
  }
}
