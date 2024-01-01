import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/order_details_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class OrderDetailsController extends GetxController with StateMixin<Order> {
  OrderDetailsController({
    required this.orderDetailsUseCase,
    required this.orderId,
  });
  final OrderDetailsUseCase orderDetailsUseCase;
  final String orderId;
  List<User> loadedUsers = [];
  List timeLine = [];
  final scrollController = ScrollController();
  final summeryKey = GlobalKey();
  final paymentKey = GlobalKey();
  final fulfillmentKey = GlobalKey();
  final customerKey = GlobalKey();
  final timelineKey = GlobalKey();
  final noteCtrl = TextEditingController();
  final refreshController = RefreshController();
  late Future<List?>? timeLineFuture;
  @override
  Future<void> onInit() async {
    await fetchOrderDetails();
    timeLineFuture = fetchTimeLine();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> fetchOrderDetails() async {
    change(null, status: RxStatus.loading());
    final result = await orderDetailsUseCase.retrieveOrder(
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
        change(success, status: RxStatus.success());
        refreshController.refreshCompleted();
        update();
      },
      (error) {
        refreshController.refreshFailed();
        change(null, status: RxStatus.error(error.toString()));
      },
    );
  }

  Future<List?> fetchTimeLine() async {
    timeLine.clear();
    await fetchOrderNotes();
    await fetchOrderNotification();
    await fetchOrderEdits();
    state?.refunds?.forEach((element) {
      timeLine.add(element);
    });
    timeLine.sort();
    return timeLine;
  }

  Future<List<OrderEdit>?> fetchOrderEdits({bool shuffle = false}) async {
    final result = await orderDetailsUseCase.retrieveAllOrderEdit(
      queryParameters: {'order_id': orderId},
    );
    return await result.when(
      (success) async {
        if (success.orderEdits != null) {
          final createdByList =
              success.orderEdits?.map((e) => e.createdBy).toSet().toList();
          success.orderEdits?.forEach((element) {
            timeLine.add(element);
            if (element.status == OrderEditStatus.requested) {
              timeLine.add(element.copyWith
                  .requestedAt(null)
                  .copyWith
                  .confirmedAt(DateTime.now()));
            } else {
              timeLine.add(element.copyWith.requestedAt(null));
            }
          });
          createdByList?.forEach(
            (element) async {
              if (loadedUsers.isNotEmpty &&
                  loadedUsers.map((e) => e.id).toList().contains(element)) {
              } else {
                await fetchUser(element ?? '');
              }
            },
          );
          return success.orderEdits;
        } else {
          // TODO: handle when edits are null
          return [];
        }
      },
      (error) {
        return null;
        // TODO: handle error
      },
    );
  }

  Future<User?> fetchUser(String userId) async {
    final result = await orderDetailsUseCase.retrieveUser(id: userId);
    return await result.when((user) {
      final userExist = loadedUsers.map((e) => e.id).toList().contains(user.id);
      if (!userExist) {
        loadedUsers.add(user);
        update([5]);
      }
      return user;
    }, (error) {
      return null;
    });
  }

  Future<void> fetchOrderNotes() async {
    final result = await orderDetailsUseCase.retrieveNotes(
      queryParameters: {
        'resource_id': orderId,
      },
    );

    result.when(
      (success) {
        if (success.notes != null) {
          success.notes?.forEach((element) {
            timeLine.add(element);
          });
        } else {
          // TODO: handle when edits are null
        }
      },
      (error) {
        // TODO: handle error
      },
    );
  }

  Future<void> fetchOrderNotification() async {
    final result = await orderDetailsUseCase.retrieveNotifications(
      queryParameters: {
        'resource_id': orderId,
      },
    );

    result.when(
      (success) {
        if (success.notifications != null) {
          success.notifications?.forEach((element) {
            timeLine.add(element);
          });
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
    final result = await orderDetailsUseCase.cancelOrder(id: orderId);
    result.when((success) async {
      EasyLoading.showSuccess('Order Canceled!');
      await fetchOrderDetails();
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

  Future<void> cancelOrderEdit(String id) async {
    loading();
    final result = await orderDetailsUseCase.cancelOrderEdit(id: id);
    result.when((success) async {
      EasyLoading.showSuccess('Order Edit Canceled!');
      await fetchOrderEdits();
    }, (error) {
      debugPrint(error.toString());
      dismissLoading();
      Get.snackbar(
        'Error ${error.code ?? ''}',
        error.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  Future<void> confirmOrderEdit(String id) async {
    loading();
    final result = await orderDetailsUseCase.confirmOrderEdit(id: id);
    result.when((success) async {
      EasyLoading.showSuccess('Order Edit Confirmed!');
      await fetchOrderEdits();
    }, (error) {
      debugPrint(error.toString());
      dismissLoading();
      Get.snackbar(
        'Error ${error.code ?? ''}',
        error.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  Future<void> createFulfillment(List<LineItem> items) async {
    loading();
    final result = await orderDetailsUseCase.createFulfillment(
      id: orderId,
      userCreateFulfillmentReq: UserCreateFulfillmentReq(items: items),
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Fulfillment created');
        await fetchOrderDetails();
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

  Future<void> createOrderShipment(
      {required String fulfillmentId, List<String>? trackingNumbers}) async {
    loading();
    final result = await orderDetailsUseCase.createOrderShipment(
      id: orderId,
      fulfillmentId: fulfillmentId,
      trackingNumbers: trackingNumbers,
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Shipment created');
        await fetchOrderDetails();
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
    final result = await orderDetailsUseCase.cancelFulfillment(
      fulfillmentId: fulfillmentId,
      id: orderId,
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Fulfillment canceled');
        await fetchOrderDetails();
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

  Future<void> createRefund(
      UserCreateRefundOrdersReq userCreateRefundOrdersReq) async {
    loading();
    final result = await orderDetailsUseCase.createRefund(
      id: orderId,
      userCreateRefundOrdersReq: userCreateRefundOrdersReq,
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Refund created');
        await fetchOrderDetails();
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
    final result = await orderDetailsUseCase.captureOrderPayment(id: orderId);
    result.when(
      (success) async {
        EasyLoading.showSuccess('Payment captured');
        await fetchOrderDetails();
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

  Future<void> updateShippingAddress(Address address) async {
    loading();
    final result = await orderDetailsUseCase.updateOrder(
      id: orderId,
      userUpdateOrderReq: UserUpdateOrderReq(shippingAddress: address),
    );

    result.when(
      (success) async {
        await fetchOrderDetails();
        dismissLoading();
      },
      (error) {
        Get.snackbar('Error updating shipping address ${error.code ?? ''}',
            error.message,
            snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      },
    );
  }

  Future<void> updateBillingAddress(Address address) async {
    loading();
    final result = await orderDetailsUseCase.updateOrder(
      id: orderId,
      userUpdateOrderReq: UserUpdateOrderReq(billingAddress: address),
    );

    result.when(
      (success) async {
        await fetchOrderDetails();
        dismissLoading();
      },
      (error) {
        Get.snackbar(
            'Error updating billing address ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      },
    );
  }

  Future<void> deleteNote(String? id, BuildContext context) async {
    if (id == null) return;
    loading();
    final result = await orderDetailsUseCase.deleteNote(id: id);
    await result.when((success) async {
      EasyLoading.showSuccess('Note deleted');
      reloadTimeLine();
    }, (error) {
      dismissLoading();
      context.showSnackBar(
        'Error deleting note, ${error.toSnackBarString()}',
      );
    });
  }

  Future<void> addNote(BuildContext context) async {
    if (noteCtrl.text.removeAllWhitespace.isEmpty) {
      return;
    }
    loading();
    final result = await orderDetailsUseCase.createNote(
        resourceId: orderId, resourceType: 'order', value: noteCtrl.text);
    await result.when((success) async {
      EasyLoading.showSuccess('Note created');
      noteCtrl.clear();
      reloadTimeLine();
    }, (error) {
      dismissLoading();
      context.showSnackBar(
        'Error creating note, ${error.toSnackBarString()}',
      );
    });
  }

  void reloadTimeLine() {
    timeLineFuture = fetchTimeLine().then((_) {
      update([5]);
      return _;
    });
  }

  Future<void> updateEmail(String email) async {
    loading();
    final result = await orderDetailsUseCase.updateOrder(
      id: orderId,
      userUpdateOrderReq: UserUpdateOrderReq(email: email),
    );

    result.when(
      (success) async {
        await fetchOrderDetails();
        dismissLoading();
      },
      (error) {
        Get.snackbar(
            'Error updating email address ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      },
    );
  }
}
