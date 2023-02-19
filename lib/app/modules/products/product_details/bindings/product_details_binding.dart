import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(productsRepository: ProductsRepo()),
    );
  }
}
