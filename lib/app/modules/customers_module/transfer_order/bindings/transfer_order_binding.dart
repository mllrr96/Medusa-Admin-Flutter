import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import '../controllers/transfer_order_controller.dart';

class TransferOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferOrderController>(
        () => TransferOrderController(ordersRepo: OrdersRepo()));
  }
}
