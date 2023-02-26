import 'package:get/get.dart';

import '../controllers/region_details_controller.dart';

class RegionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegionDetailsController>(
      () => RegionDetailsController(),
    );
  }
}
