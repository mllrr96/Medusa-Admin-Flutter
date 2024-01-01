import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/order_edit_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

class AddUpdateOrderEditController extends GetxController with StateMixin<OrderEdit> {
  AddUpdateOrderEditController({required this.orderEditUseCase, required this.order});
  final OrderEditUseCase orderEditUseCase;
  final Order? order;
  String? get orderId => order?.id;
  final noteCtrl = TextEditingController();

  Future<void> fetchOrderEdits({bool showLoading = true}) async {
    if (showLoading) {
      change(null, status: RxStatus.loading());
    }
    final result = await orderEditUseCase.fetchOrderEdits(queryParameters: {'order_id': orderId!});
    result.when((success) async {
      final createdOrderEdits = success.orderEdits!.where((element) => element.status == OrderEditStatus.created);

      if ((success.orderEdits?.isEmpty ?? false) || createdOrderEdits.isEmpty) {
        final result = await orderEditUseCase.createOrderEdit(id: orderId!);
        result.when((orderEdit) {
          change(orderEdit, status: RxStatus.success());
          noteCtrl.text = orderEdit.internalNote ?? '';
        }, (error) => change(null, status: RxStatus.error(error.message)));
      } else {
        //TODO : in case there are more than one order edit, let the user choose the on they want
        change(createdOrderEdits.first, status: RxStatus.success());
        noteCtrl.text = createdOrderEdits.first.internalNote ?? '';
      }
    }, (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> updateLineItem({
    required String orderEditId,
    required String itemId,
    required int quantity,
  }) async {
    loading();
    final result = await orderEditUseCase.upsertLineItemChange(id: orderEditId, itemId: itemId, quantity: quantity);
    result.when((orderEdit) async {
      change(orderEdit, status: RxStatus.success());
      dismissLoading();
    }, (error) {
      EasyLoading.showError('Error updating line item');
    });
  }

  Future<void> deleteLineItem({
    required String orderEditId,
    required String itemId,
  }) async {
    loading();
    final result = await orderEditUseCase.deleteLineItem(id: orderEditId, itemId: itemId);
    result.when((orderEdit) {
      change(orderEdit, status: RxStatus.success());
      dismissLoading();
    }, (error) {
      EasyLoading.showError('Error deleting line item');
    });
  }

  Future<void> save(String orderEditId, BuildContext context) async {
    final result = await orderEditUseCase.requestOrderEdit(id: orderEditId);
    result.when((success) {
      EasyLoading.showSuccess('Order Edit Requested');
      context.popRoute();
    }, (error) {
      EasyLoading.showError('Error requesting order edit');
    });
  }

  Future<void> updateOrderEdit({required String orderEditId, required String internalNote}) async {
    loading();
    final result = await orderEditUseCase.updateOrderEdit(id: orderEditId, internalNote: internalNote);
    result.when((orderEdit) {
      EasyLoading.showSuccess('Order Edit updated');
      change(orderEdit, status: RxStatus.success());
      noteCtrl.text = orderEdit.internalNote ?? '';
    }, (error) {
      EasyLoading.showError('Error requesting order edit');
    });
  }

  @override
  Future<void> onInit() async {
    // if (orderId == null) {
    //   Get.back();
    // }
    await fetchOrderEdits();
    super.onInit();
  }

  @override
  void onClose() {
    noteCtrl.dispose();
    super.onClose();
  }

  addLineItems({required String orderEditId, required List<ProductVariant> items, required BuildContext context}) async {
    loading();

    for (var variant in items) {
      final result = await orderEditUseCase.addLineItem(id: orderEditId, userAddLineItemReq: UserAddLineItemReq(quantity: 1, variantId: variant.id!));
      result.when((orderEdit) {
        change(orderEdit, status: RxStatus.success());
      }, (error) {
        context.showSnackBar(error.toSnackBarString());
      });
    }
    dismissLoading();
    if(context.mounted) {
      context.showSnackBar('Line items added successfully');
    }
  }
}
