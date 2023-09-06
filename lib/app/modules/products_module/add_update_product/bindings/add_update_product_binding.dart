import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/repository/product_type/product_type_repo.dart';
import 'package:medusa_admin/app/data/repository/upload/upload_repo.dart';

import '../controllers/add_update_product_controller.dart';

class AddUpdateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddUpdateProductController(
        productsRepo: ProductsRepo(), productTypeRepo: ProductTypeRepo(), collectionRepo: CollectionRepo(), uploadRepo: UploadRepo()));
  }
}
