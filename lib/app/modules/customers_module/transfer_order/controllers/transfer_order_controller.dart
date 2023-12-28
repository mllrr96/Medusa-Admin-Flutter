import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_order.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

class TransferOrderController extends GetxController {
  TransferOrderController({required this.ordersRepo, required this.order});
  final OrdersRepo ordersRepo;
  final Order order;
  final currentOwnerCtrl = TextEditingController();
  final newOwnerCtrl = TextEditingController();
  // ignore: unnecessary_cast
  Rx<Customer?> selectedCustomer = (null as Customer?).obs;
  Future<void> updateOrder(BuildContext context) async {
    loading();
    final result = await ordersRepo.updateOrder(
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
