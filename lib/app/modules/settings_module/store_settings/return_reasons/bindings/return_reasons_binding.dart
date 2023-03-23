import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/return_reason/return_reason_repo.dart';

import '../controllers/return_reasons_controller.dart';

class ReturnReasonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReturnReasonsController>(() => ReturnReasonsController(returnReasonRepo: ReturnReasonRepo()));
  }
}
