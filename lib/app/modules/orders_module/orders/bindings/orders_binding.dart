import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';

import '../controllers/orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
      () => OrdersController(
          ordersRepository: OrdersRepo(), regionsRepo: RegionsRepo(), salesChannelRepo: SalesChannelRepo()),
    );
  }
}
