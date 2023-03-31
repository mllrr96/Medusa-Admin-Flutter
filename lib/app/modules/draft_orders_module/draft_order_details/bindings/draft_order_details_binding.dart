import 'package:get/get.dart';

import '../controllers/draft_order_details_controller.dart';

class DraftOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DraftOrderDetailsController>(
      () => DraftOrderDetailsController(),
    );
  }
}
