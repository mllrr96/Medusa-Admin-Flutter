import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';

import '../controllers/customer_details_controller.dart';

class CustomerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerDetailsController>(() => CustomerDetailsController(customerRepo: CustomerRepository()));
  }
}
