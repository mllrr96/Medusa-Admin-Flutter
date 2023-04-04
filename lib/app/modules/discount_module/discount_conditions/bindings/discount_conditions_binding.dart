import 'package:get/get.dart';
import '../controllers/discount_conditions_controller.dart';

class DiscountConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscountConditionsController>(() => DiscountConditionsController());
  }
}
