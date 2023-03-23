import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';

import '../controllers/customers_controller.dart';

class CustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomersController>(() => CustomersController(customerRepo: CustomerRepository()));
  }
}
