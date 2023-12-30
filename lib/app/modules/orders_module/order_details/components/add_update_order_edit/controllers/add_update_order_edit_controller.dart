import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order_edit/order_edit_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

import '../../../../../../data/models/req/user_order_edit.dart';

class AddUpdateOrderEditController extends GetxController with StateMixin<OrderEdit> {
  AddUpdateOrderEditController({required this.orderEditRepo, required this.order});
  final OrderEditRepo orderEditRepo;
  final Order? order;
  String? get orderId => order?.id;
  final noteCtrl = TextEditingController();

  Future<void> loadOrderEdit({bool showLoading = true}) async {
    if (showLoading) {
      change(null, status: RxStatus.loading());
    }
    final result = await orderEditRepo.retrieveAllOrderEdit(queryParameters: {'order_id': orderId!});
    result.when((success) async {
      final createdOrderEdits = success.orderEdits!.where((element) => element.status == OrderEditStatus.created);

      if ((success.orderEdits?.isEmpty ?? false) || createdOrderEdits.isEmpty) {
        final result = await orderEditRepo.createOrderEdit(id: orderId!);
        result.when((success) {
          change(success.orderEdit, status: RxStatus.success());
          noteCtrl.text = success.orderEdit?.internalNote ?? '';
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
    final result = await orderEditRepo.upsertLineItemChange(id: orderEditId, itemId: itemId, quantity: quantity);
    result.when((success) async {
      change(success.orderEdit, status: RxStatus.success());
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
    final result = await orderEditRepo.deleteLineItem(id: orderEditId, itemId: itemId);
    result.when((success) {
      change(success.orderEdit, status: RxStatus.success());
      dismissLoading();
    }, (error) {
      EasyLoading.showError('Error deleting line item');
    });
  }

  Future<void> save(String orderEditId, BuildContext context) async {
    final result = await orderEditRepo.requestOrderEdit(id: orderEditId);
    result.when((success) {
      EasyLoading.showSuccess('Order Edit Requested');
      context.popRoute();
    }, (error) {
      EasyLoading.showError('Error requesting order edit');
    });
  }

  Future<void> updateOrderEdit({required String orderEditId, required String internalNote}) async {
    loading();
    final result = await orderEditRepo.updateOrderEdit(id: orderEditId, internalNote: internalNote);
    result.when((success) {
      EasyLoading.showSuccess('Order Edit updated');
      change(success.orderEdit, status: RxStatus.success());
      noteCtrl.text = success.orderEdit?.internalNote ?? '';
    }, (error) {
      EasyLoading.showError('Error requesting order edit');
    });
  }

  @override
  Future<void> onInit() async {
    // if (orderId == null) {
    //   Get.back();
    // }
    await loadOrderEdit();
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
      final result = await orderEditRepo.addLineItem(id: orderEditId, userAddLineItemReq: UserAddLineItemReq(quantity: 1, variantId: variant.id!));
      result.when((success) {
        change(success.orderEdit, status: RxStatus.success());
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
