import 'package:get/get.dart';

import '../controllers/transfer_order_controller.dart';

class TransferOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferOrderController>(
      () => TransferOrderController(),
    );
  }
}
