import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';

import '../controllers/group_details_controller.dart';

class GroupDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupDetailsController>(() => GroupDetailsController(customerGroupRepo: CustomerGroupRepo()));
  }
}
