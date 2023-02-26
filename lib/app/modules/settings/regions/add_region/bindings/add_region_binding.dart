import 'package:get/get.dart';

import '../controllers/add_region_controller.dart';

class AddRegionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRegionController>(
      () => AddRegionController(),
    );
  }
}
