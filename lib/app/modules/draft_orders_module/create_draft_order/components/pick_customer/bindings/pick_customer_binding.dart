import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';

import '../controllers/pick_customer_controller.dart';

class PickCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickCustomerController>(() => PickCustomerController(customerRepo: CustomerRepo()));
  }
}
