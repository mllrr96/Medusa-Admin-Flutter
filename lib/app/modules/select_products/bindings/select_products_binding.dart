import 'package:get/get.dart';
import '../../../data/repository/product_variant/product_variant_repo.dart';
import '../controllers/select_products_controller.dart';

class SelectProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectProductsController(productVariantRepo: ProductVariantRepo()));
  }
}
