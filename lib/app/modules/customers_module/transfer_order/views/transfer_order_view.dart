import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/pick_customer/controllers/pick_customer_controller.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/fulfillment_label.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/payment_status_label.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../../../components/adaptive_filled_button.dart';
import '../controllers/transfer_order_controller.dart';

class TransferOrderView extends GetView<TransferOrderController> {
  const TransferOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final order = controller.order;
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: const Text('Transfer Order'),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          padding: EdgeInsets.only(bottom: bottomViewPadding, left: 24, right: 24, top: bottomViewPadding / 2),
          child: Obx(() {
            return AdaptiveFilledButton(
                onPressed:
                    controller.selectedCustomer.value != null ? () async => await controller.updateOrder() : null,
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ));
          }),
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          children: [
            AlternativeOrderCard(order, onTap: null),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FulfillmentStatusLabel(fulfillmentStatus: order.fulfillmentStatus),
                PaymentStatusLabel(paymentStatus: order.paymentStatus)
              ],
            ),
            space,
            LabeledTextField(
              label: 'Current Owner',
              controller: controller.currentOwnerCtrl,
              readOnly: true,
            ),
            LabeledTextField(
              label: 'New Owner',
              controller: controller.newOwnerCtrl,
              hintText: 'Select...',
              readOnly: true,
              onTap: () async {
                final result = await Get.toNamed(Routes.PICK_CUSTOMER,
                    arguments: PickCustomerReq(disabledCustomers: [order.customer!]));
                if (result is PickCustomerRes) {
                  controller.selectedCustomer.value = result.selectedCustomers.first;
                  final customer = controller.selectedCustomer.value;
                  controller.newOwnerCtrl.text =
                      '${customer?.firstName ?? ''} ${customer?.lastName ?? ''} ${customer?.firstName != null || customer?.lastName != null ? '-' : ''} ${customer?.email ?? ''}';
                }
              },
            ),
          ],
        )),
      ),
    );
  }
}
