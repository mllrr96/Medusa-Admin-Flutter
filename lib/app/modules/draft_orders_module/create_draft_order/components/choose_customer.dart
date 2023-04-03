import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/pick_customer/controllers/pick_customer_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../controllers/create_draft_order_controller.dart';

class ChooseCustomerView extends StatelessWidget {
  const ChooseCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return GetBuilder<ChooseCustomerController>(
      builder: (controller) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            children: [
              Text('Choose Shipping Option', style: largeTextStyle),
              space,
              TextField(
                controller: controller.customerCtrl,
                onTap: () async {
                  final result = await Get.toNamed(Routes.PICK_CUSTOMER,
                      arguments: PickCustomerReq(
                          selectedCustomers:
                              controller.selectedCustomer.value != null ? [controller.selectedCustomer.value!] : null));
                  if (result is PickCustomerRes) {
                    final customer = result.selectedCustomers.first;
                    controller.selectedCustomer.value = customer;
                    controller.customerCtrl.text = customer.firstName != null
                        ? '${customer.firstName ?? ''} ${customer.lastName ?? ''} (${customer.email})'
                        : customer.email;
                    controller.update();
                    CreateDraftOrderController.instance.update();
                  }
                },
                readOnly: true,
                style: smallTextStyle,
                decoration: InputDecoration(
                  hintText: 'Choose customer',
                  suffixIcon: controller.selectedCustomer.value != null
                      ? AdaptiveIcon(
                          onPressed: () {
                            controller.selectedCustomer.value = null;
                            controller.customerCtrl.clear();
                            controller.update();
                          },
                          icon: const Icon(CupertinoIcons.clear_circled))
                      : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChooseCustomerController extends GetxController {
  static final ChooseCustomerController instance = Get.find<ChooseCustomerController>();

  ChooseCustomerController();

  // ignore: unnecessary_cast
  Rx<Customer?> selectedCustomer = (null as Customer?).obs;
  final customerCtrl = TextEditingController();

  @override
  void onClose() {
    customerCtrl.dispose();
    super.onClose();
  }
}
