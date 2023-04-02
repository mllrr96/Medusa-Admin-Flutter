import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class OrderDetailsController extends GetxController with StateMixin<Order> {
  OrderDetailsController({required this.ordersRepo});
  OrdersRepo ordersRepo;
  String orderId = Get.arguments;

  @override
  Future<void> onInit() async {
    await loadOrderDetails();
    super.onInit();
  }

  Future<void> loadOrderDetails() async {
    change(null, status: RxStatus.loading());
    final result = await ordersRepo.retrieveOrder(
      id: orderId,
      queryParameters: {
        'expand':
            'customer,billing_address,shipping_address,discounts,discounts.rule,shipping_methods,payments,fulfillments,fulfillments.tracking_links,returns,claims,swaps,swaps.return_order,swaps.additional_items,edits,currency'
      },
    );

    result.when(
      (success) {
        if (success.order != null) {
          change(success.order!, status: RxStatus.success());
          update();
        } else {
          change(null, status: RxStatus.error());
        }
      },
      (error) => change(null, status: RxStatus.error()),
    );
  }

  Future<void> cancelOrder() async {
    loading();
    final result = await ordersRepo.cancelOrder(id: orderId);
    result.when((success) async {
      EasyLoading.showSuccess('Order Canceled!');
      await loadOrderDetails();
    }, (error) {
      debugPrint(error.toString());
      dismissLoading();
      Get.snackbar(
        'Error ${error.code}',
        error.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }
}
