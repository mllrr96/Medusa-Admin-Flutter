import 'package:get/get.dart';

import '../../../../data/repository/customer_group/customer_group_repo.dart';
import '../controllers/create_update_group_controller.dart';

class CreateUpdateGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUpdateGroupController>(() => CreateUpdateGroupController(customerGroupRepo: CustomerGroupRepo()));
  }
}
