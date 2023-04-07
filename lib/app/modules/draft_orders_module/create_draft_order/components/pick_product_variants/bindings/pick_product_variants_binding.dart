import 'package:get/get.dart';
import '../../../../../../data/repository/product_variant/product_variant_repo.dart';
import '../controllers/pick_product_variants_controller.dart';

class PickProductVariantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PickProductVariantsController(productVariantRepo: ProductVariantRepo()));
  }
}
