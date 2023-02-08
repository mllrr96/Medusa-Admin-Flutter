import 'package:get/get.dart';

import '../controllers/discounts_controller.dart';

class DiscountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscountsController>(
      () => DiscountsController(),
    );
  }
}
