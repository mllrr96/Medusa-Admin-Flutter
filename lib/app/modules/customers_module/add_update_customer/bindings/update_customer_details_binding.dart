import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';
import '../controllers/update_customer_details_controller.dart';

class AddUpdateCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateCustomerController>(() => AddUpdateCustomerController(customerRepo: CustomerRepo()));
  }
}
