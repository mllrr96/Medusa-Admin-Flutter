import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';

class OrderDetailsController extends GetxController with StateMixin<Order> {
  OrderDetailsController({required this.ordersRepository});
  OrdersRepository ordersRepository;
  String orderId = Get.arguments;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await loadOrderDetails();
    super.onReady();
  }

  Future<void> loadOrderDetails() async {
    change(null, status: RxStatus.loading());
    final result = await ordersRepository.retrieve(id: orderId, queryParameters: {
      'expand':
          'customer,billing_address,shipping_address,discounts,discounts.rule,shipping_methods,payments,fulfillments,fulfillments.tracking_links,returns,claims,swaps,swaps.return_order,swaps.additional_items,edits,currency'
    });

    result.when((success) {
      if (success.order != null) {
        change(success.order!, status: RxStatus.success());
        update();
      } else {
        change(null, status: RxStatus.error());
      }
    }, (error) => change(null, status: RxStatus.error()));
  }
}
