import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/dio_service.dart';

import '../../../data/repository/product/products_repo.dart';
import '../controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(productsRepository: ProductsRepository()),
    );
  }
}
