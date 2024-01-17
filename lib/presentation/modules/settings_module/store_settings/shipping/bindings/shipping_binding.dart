import 'package:get/get.dart';

import '../controllers/shipping_controller.dart';

class ShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShippingController>(
      () => ShippingController(),
    );
  }
}
