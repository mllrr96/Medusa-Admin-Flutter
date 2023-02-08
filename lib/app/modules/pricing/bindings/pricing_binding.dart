import 'package:get/get.dart';

import '../controllers/pricing_controller.dart';

class PricingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricingController>(
      () => PricingController(),
    );
  }
}
