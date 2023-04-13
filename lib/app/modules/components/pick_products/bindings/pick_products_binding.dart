import 'package:get/get.dart';

class PickProductsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<PickProductsController>(() => PickProductsController(productsRepo: ProductsRepo()));
  }
}
