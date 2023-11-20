import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order_edit/order_edit_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class AddUpdateOrderEditController extends GetxController with StateMixin<OrderEdit> {
  AddUpdateOrderEditController({required this.orderEditRepo});
  final OrderEditRepo orderEditRepo;
  final Order? order = Get.arguments;
  String? get orderId => order?.id;
  final noteCtrl = TextEditingController();
  Future<void> loadOrderEdit() async {
    change(null, status: RxStatus.loading());
    final result = await orderEditRepo.retrieveAllOrderEdit(queryParameters: {'order_id': orderId!});
    result.when((success) async {
      if (success.orderEdits?.isEmpty ?? false) {
        final result = await orderEditRepo.createOrderEdit(id: orderId!);
        result.when((success) => change(success.orderEdit, status: RxStatus.success()),
            (error) => change(null, status: RxStatus.error(error.message)));
      } else {
        //TODO : in case there are more than one order edit, let the user choose the on they want
        change(success.orderEdits?.first, status: RxStatus.success());
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
      dismissLoading();
      await loadOrderEdit();
    }, (error) {
      print(error.toString());
      EasyLoading.showError('Error updating line item');
    });
  }

  Future<void> save(String orderEditId) async {
    final result = await orderEditRepo.requestOrderEdit(id: orderEditId);
    result.when((success) {
      EasyLoading.showSuccess('Order Edit Requested');
    }, (error) {
      print(error.toString());
      EasyLoading.showError('Error requesting order edit');
    });
  }

  @override
  Future<void> onInit() async {
    if (orderId == null) {
      Get.back();
    }
    await loadOrderEdit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    noteCtrl.dispose();
    super.onClose();
  }
}
