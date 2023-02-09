import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';

class OrdersController extends GetxController with StateMixin<List<Order>> {
  OrdersController({required this.ordersRepository});
  OrdersRepository ordersRepository;

  @override
  Future<void> onInit() async {
    await loadOrders();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> loadOrders() async {
    change(null, status: RxStatus.loading());
    try {
      final result = await ordersRepository.retrieveOrders();
      if (result != null && result.orders != null && result.orders!.isNotEmpty) {
        change(result.orders, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error('Error'));
      debugPrint(e.toString());
    }
  }
}
