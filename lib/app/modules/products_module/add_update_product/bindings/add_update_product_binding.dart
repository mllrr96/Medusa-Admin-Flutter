import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

import '../controllers/add_update_product_controller.dart';

class AddUpdateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddUpdateProductController(productsRepo: ProductsRepo()));
  }
}
