import 'package:get/get.dart';

import '../controllers/add_update_product_controller.dart';

class AddUpdateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateProductController>(
      () => AddUpdateProductController(),
    );
  }
}
