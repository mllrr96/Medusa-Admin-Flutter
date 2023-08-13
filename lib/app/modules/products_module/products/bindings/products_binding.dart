import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/product_tag/product_tag_repo.dart';

import '../../../../data/repository/product/products_repo.dart';
import '../controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(productsRepo: ProductsRepo(), productTagRepo: ProductTagRepo(), collectionRepo: CollectionRepo()),
    );
  }
}
