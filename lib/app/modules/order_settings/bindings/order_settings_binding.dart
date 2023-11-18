import 'package:get/get.dart';

import '../controllers/order_settings_controller.dart';

class OrderSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderSettingsController>(
      () => OrderSettingsController(),
    );
  }
}
