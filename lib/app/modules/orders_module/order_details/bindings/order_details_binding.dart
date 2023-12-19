import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/note/note_repo.dart';
import 'package:medusa_admin/app/data/repository/notification/notification_repo.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/data/repository/order_edit/order_edit_repo.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';

import '../../../../data/repository/fulfillment/fulfillment_repo.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController(
        ordersRepo: OrdersRepo(),
        orderEditsRepo: OrderEditRepo(),
        noteRepo: NoteRepo(),
        notificationRepo: NotificationRepo(),
        fulfillmentRepo: FulfillmentRepo(),
        userRepo: UserRepo(),
        orderId: ''));
  }
}
