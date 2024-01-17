import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';

import 'pick_customer/controllers/pick_customer_controller.dart';

class ChooseCustomerView extends StatelessWidget {
  const ChooseCustomerView({super.key, this.onCustomerChanged});
  final void Function(Customer?)? onCustomerChanged;
  @override
  Widget build(BuildContext context) {
    final largeTextStyle = context.bodyLarge;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return GetBuilder<ChooseCustomerController>(
      init: ChooseCustomerController(),
      builder: (controller) {
        return Column(
          children: [
            Text('Choose Shipping Option', style: largeTextStyle),
            space,
            TextField(
              controller: controller.customerCtrl,
              onTap: () async {
                final result = await context.pushRoute(PickCustomerRoute(
                    pickCustomerReq: PickCustomerReq(
                        selectedCustomers: controller.selectedCustomer != null
                            ? [controller.selectedCustomer!]
                            : null)
                ));
                if (result is PickCustomerRes) {
                  final customer = result.selectedCustomers.first;
                  controller.selectedCustomer = customer;
                  controller.customerCtrl.text = customer.firstName != null
                      ? '${customer.firstName ?? ''} ${customer.lastName ?? ''} (${customer.email})'
                      : customer.email;
                  controller.update();
                  if (onCustomerChanged != null) {
                    onCustomerChanged!(controller.selectedCustomer);
                  }
                }
              },
              readOnly: true,
              style: smallTextStyle,
              decoration: InputDecoration(
                hintText: 'Choose customer',
                suffixIcon: controller.selectedCustomer != null
                    ? IconButton(
                        onPressed: () {
                          controller.selectedCustomer = null;
                          controller.customerCtrl.clear();
                          controller.update();
                          if (onCustomerChanged != null) {
                            onCustomerChanged!(null);
                          }
                        },
                        icon: const Icon(CupertinoIcons.clear_circled))
                    : const Icon(Icons.arrow_drop_down),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ChooseCustomerController extends GetxController {
  static ChooseCustomerController get instance =>
      Get.find<ChooseCustomerController>();

  ChooseCustomerController();
  final customerCtrl = TextEditingController();
  Customer? selectedCustomer;

  @override
  void onClose() {
    customerCtrl.dispose();
    super.onClose();
  }
}
