import 'package:get/get.dart';
import '../../../../../../data/repository/product_variant/product_variant_repo.dart';
import '../controllers/add_product_variants_controller.dart';

class AddProductVariantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddProductVariantsController(productVariantRepo: ProductVariantRepo()));
  }
}
