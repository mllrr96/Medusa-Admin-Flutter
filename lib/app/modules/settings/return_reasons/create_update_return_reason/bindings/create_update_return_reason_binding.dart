import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/return_reason/return_reason_repo.dart';

import '../controllers/create_update_return_reason_controller.dart';

class CreateUpdateReturnReasonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUpdateReturnReasonController>(
        () => CreateUpdateReturnReasonController(returnReasonRepo: ReturnReasonRepo()));
  }
}
