import 'package:get/get.dart';
import '../../../../data/repository/discount/discount_repo.dart';
import '../controllers/discounts_controller.dart';

class DiscountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscountsController>(() => DiscountsController(discountRepo: DiscountRepo()));
  }
}
