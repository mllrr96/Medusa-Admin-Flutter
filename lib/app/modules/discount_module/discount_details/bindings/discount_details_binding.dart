import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/data/repository/discount_condition/discount_condition_repo.dart';

import '../controllers/discount_details_controller.dart';

class DiscountDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscountDetailsController>(() => DiscountDetailsController(discountRepo: DiscountRepo(), discountConditionRepo: DiscountConditionRepo()));
  }
}
