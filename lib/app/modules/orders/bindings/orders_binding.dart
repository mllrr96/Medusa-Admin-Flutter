import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/orders.dart';
import 'package:medusa_admin/app/data/service/dio_service.dart';

import '../controllers/orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
      () => OrdersController(ordersRepository: OrdersRepository(DioService.instance.dio)),
    );
  }
}
