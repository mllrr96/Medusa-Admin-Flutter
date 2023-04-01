import 'package:get/get.dart';

import '../../../../data/repository/customer_group/customer_group_repo.dart';
import '../controllers/groups_controller.dart';

class GroupsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupsController>(
      () => GroupsController(customerGroupRepo: CustomerGroupRepo())
    );
  }
}
