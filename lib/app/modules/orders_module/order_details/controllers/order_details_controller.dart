import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/data/models/store/index.dart' as medusa;
import '../../../../data/models/req/user_fulfillment_req.dart';
import '../../../../data/models/req/user_order.dart';
import '../../../../data/repository/fulfillment/fulfillment_repo.dart';
import '../../../../data/repository/note/note_repo.dart';
import '../../../../data/repository/notification/notification_repo.dart';
import '../../../../data/repository/order_edit/order_edit_repo.dart';

class OrderDetailsController extends GetxController with StateMixin<Order> {
  OrderDetailsController({
    required this.ordersRepo,
    required this.orderEditsRepo,
    required this.noteRepo,
    required this.notificationRepo,
    required this.fulfillmentRepo,
  });
  final OrdersRepo ordersRepo;
  final OrderEditRepo orderEditsRepo;
  final NoteRepo noteRepo;
  final NotificationRepo notificationRepo;
  final FulfillmentRepo fulfillmentRepo;
  String orderId = Get.arguments;
  List<OrderEdit>? orderEdits;
  List<Note>? notes;
  List<medusa.Notification>? notifications;
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
    await loadOrderNotes();
    await loadOrderNotification();
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
            'swaps.additional_items.variant.product,swaps.fulfillments,returnable_items,edits,currency,edits,region.countries,shipping_address.country',
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

  Future<void> loadOrderNotes() async {
    final result = await noteRepo.retrieveNotes(
      queryParameters: {
        'resource_id': orderId,
      },
    );

    result.when(
      (success) {
        if (success.notes != null) {
          notes = success.notes;
        } else {
          // TODO: handle when edits are null
        }
      },
      (error) {
        // TODO: handle error
      },
    );
  }

  Future<void> loadOrderNotification() async {
    final result = await notificationRepo.retrieveNotifications(
      queryParameters: {
        'resource_id': orderId,
      },
    );

    result.when(
      (success) {
        if (success.notifications != null) {
          notifications = success.notifications;
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

  Future<void> createFulfillment(List<LineItem> items) async {
    loading();
    final result = await fulfillmentRepo.createFulfillment(
      id: orderId,
      userCreateFulfillmentReq: UserCreateFulfillmentReq(items: items),
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Fulfillment created');
        await loadOrderDetails();
      },
      (error) {
        debugPrint(error.toString());
        dismissLoading();
        Get.snackbar(
          'Error ${error.code}',
          error.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> createOrderShipment({required String fulfillmentId, List<String>? trackingNumbers}) async {
    loading();
    final result = await ordersRepo.createOrderShipment(
      id: orderId,
      fulfillmentId: fulfillmentId,
      trackingNumbers: trackingNumbers,
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Shipment created');
        await loadOrderDetails();
      },
      (error) {
        debugPrint(error.toString());
        dismissLoading();
        Get.snackbar(
          'Error ${error.code}',
          error.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> cancelFulfillment(String fulfillmentId) async {
    loading();
    final result = await fulfillmentRepo.cancelFulfillment(
      fulfillmentId: fulfillmentId,
      id: orderId,
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Fulfillment canceled');
        await loadOrderDetails();
      },
      (error) {
        debugPrint(error.toString());
        dismissLoading();
        Get.snackbar(
          'Error ${error.code}',
          error.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> createRefund(UserCreateRefundOrdersReq userCreateRefundOrdersReq) async {
    loading();
    final result = await ordersRepo.createRefund(
      id: orderId,
      userCreateRefundOrdersReq: userCreateRefundOrdersReq,
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Refund created');
        await loadOrderDetails();
      },
      (error) {
        debugPrint(error.toString());
        dismissLoading();
        Get.snackbar(
          'Error ${error.code}',
          error.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> capturePayment() async {
    loading();
    final result = await ordersRepo.captureOrderPayment(id: orderId);
    result.when(
      (success) async {
        EasyLoading.showSuccess('Payment captured');
        await loadOrderDetails();
      },
      (error) {
        debugPrint(error.toString());
        dismissLoading();
        Get.snackbar(
          'Error ${error.code}',
          error.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }
}
