import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/repository/order_edit/order_edit_repo.dart';

class OrderDetailsController extends GetxController with StateMixin<Order> {
  OrderDetailsController({required this.ordersRepo, required this.orderEditsRepo});
  OrdersRepo ordersRepo;
  OrderEditRepo orderEditsRepo;
  String orderId = Get.arguments;
  List<OrderEdit>? orderEdits;
  final scrollController = ScrollController();
  final summeryKey = GlobalKey();
  final paymentKey = GlobalKey();
  final fulfillmentKey = GlobalKey();
  final customerKey = GlobalKey();
  final timelineKey = GlobalKey();
  @override
  Future<void> onInit() async {
    await loadOrderDetails();
    await loadOrderEdits();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> loadOrderDetails() async {
    change(null, status: RxStatus.loading());
    final result = await ordersRepo.retrieveOrder(
      id: orderId,
      queryParameters: {
        'expand': 'customer,billing_address,shipping_address,discounts,discounts.rule,shipping_methods,payments,items,'
            'fulfillments,fulfillments.tracking_links,returns,returns.shipping_method,returns.shipping_method.tax_lines,'
            'refunds,claims,claims.claim_items,claims.claim_items.item,claims.fulfillments,claims.return_order,'
            'claims.additional_items,claims.additional_items.variant,claims.additional_items.variant.product,'
            'swaps,swaps.return_order,swaps.additional_items,swaps.additional_items.variant,'
            'swaps.additional_items.variant.product,swaps.fulfillments,returnable_items,edits,currency,edits',
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

  Future<void> loadOrderEdits() async {
    final result = await orderEditsRepo.retrieveAllOrderEdit(
      queryParameters: {
        'order_id': orderId,
      },
    );

    result.when(
      (success) {
        if (success.orderEdits != null) {
          orderEdits = success.orderEdits;
        } else {
          // TODO: handle when edits are null
        }
      },
      (error) {
        // TODO: handle error
      },
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
