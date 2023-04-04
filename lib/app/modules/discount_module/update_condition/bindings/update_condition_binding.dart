import 'package:get/get.dart';

import '../controllers/update_condition_controller.dart';

class UpdateConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateConditionController>(
      () => UpdateConditionController(),
    );
  }
}
