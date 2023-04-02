import 'package:get/get.dart';
import '../../../../data/repository/discount/discount_repo.dart';
import '../controllers/add_update_discount_controller.dart';

class AddUpdateDiscountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateDiscountController>(() => AddUpdateDiscountController(discountRepo: DiscountRepo()));
  }
}
