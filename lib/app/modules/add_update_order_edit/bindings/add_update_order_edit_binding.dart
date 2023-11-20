import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/order_edit/order_edit_repo.dart';

import '../controllers/add_update_order_edit_controller.dart';

class AddUpdateOrderEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateOrderEditController>(
      () => AddUpdateOrderEditController(orderEditRepo: OrderEditRepo()),
    );
  }
}
