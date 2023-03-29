import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(ordersRepo: OrdersRepo()),
    );
  }
}
