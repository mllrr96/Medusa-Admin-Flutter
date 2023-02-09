import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/orders.dart';

import '../../../data/models/res/orders.dart';

class OrdersController extends GetxController with StateMixin<UserOrdersRes> {
  OrdersController({required this.ordersRepository});
  OrdersRepository ordersRepository;

  @override
  Future<void> onInit() async {
    await loadOrders();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadOrders() async {
    change(null, status: RxStatus.loading());
    try {
      final result = await ordersRepository.retrieveOrders();
      if (result != null) {
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error('Error'));
      debugPrint(e.toString());
    }
  }
}
