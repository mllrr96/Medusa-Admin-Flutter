import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/pick_customer/controllers/pick_customer_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

class ChooseCustomerView extends StatelessWidget {
  const ChooseCustomerView({Key? key, this.onCustomerChanged})
      : super(key: key);
  final void Function(Customer?)? onCustomerChanged;
  @override
  Widget build(BuildContext context) {
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = Gap(12);
    return GetBuilder<ChooseCustomerController>(
      builder: (controller) {
        return Column(
          children: [
            Text('Choose Shipping Option', style: largeTextStyle),
            space,
            TextField(
              controller: controller.customerCtrl,
              onTap: () async {
                final result = await Get.toNamed(Routes.PICK_CUSTOMER,
                    arguments: PickCustomerReq(
                        selectedCustomers: controller.selectedCustomer != null
                            ? [controller.selectedCustomer!]
                            : null));
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
                    ? AdaptiveIcon(
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
