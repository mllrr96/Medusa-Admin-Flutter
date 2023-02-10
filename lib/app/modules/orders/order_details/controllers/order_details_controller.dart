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

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadOrderDetails() async {
    change(null, status: RxStatus.loading());
    try {
      final result = await ordersRepository.retrieve(
          id: orderId, queryParameters: {'expand': 'customer,items,payments,fulfillments,cart,shipping_methods,currency'});
      if (result != null && result.order != null) {
        change(result.order!, status: RxStatus.success());
        update();
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
