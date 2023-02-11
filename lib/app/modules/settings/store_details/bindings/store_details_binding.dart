import 'package:get/get.dart';

import '../controllers/store_details_controller.dart';

class StoreDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreDetailsController>(
      () => StoreDetailsController(),
    );
  }
}
