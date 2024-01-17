import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/orders_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class TransferOrderController extends GetxController {
  TransferOrderController({required this.ordersUseCase, required this.order});
  final OrdersUseCase ordersUseCase;
  final Order order;
  final currentOwnerCtrl = TextEditingController();
  final newOwnerCtrl = TextEditingController();
  // ignore: unnecessary_cast
  Rx<Customer?> selectedCustomer = (null as Customer?).obs;
  Future<void> updateOrder(BuildContext context) async {
    loading();
    final result = await ordersUseCase.updateOrder(
        id: order.id!, userUpdateOrderReq: UserUpdateOrderReq(customerId: selectedCustomer.value!.id!));
    result.when((success) {
      EasyLoading.showSuccess('Order transferred');
      context.popRoute(true);
    }, (error) {
      context.showSnackBar(error.toSnackBarString());
    });
    dismissLoading();
  }

  @override
  void onInit() {
    final customer = order.customer;
    currentOwnerCtrl.text =
        '${customer?.firstName ?? ''} ${customer?.lastName ?? ''} ${customer?.firstName != null || customer?.lastName != null ? '-' : ''} ${customer?.email ?? ''}';
    super.onInit();
  }

  @override
  void onClose() {
    currentOwnerCtrl.dispose();
    newOwnerCtrl.dispose();
    super.onClose();
  }
}
