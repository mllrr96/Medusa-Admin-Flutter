import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:medusa_admin/domain/use_case/order/orders_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/modules/draft_orders_module/create_draft_order/components/pick_customer/controllers/pick_customer_controller.dart';
import 'package:medusa_admin/presentation/modules/orders_module/orders/components/fulfillment_label.dart';
import 'package:medusa_admin/presentation/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/presentation/modules/orders_module/orders/components/payment_status_label.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../controllers/transfer_order_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class TransferOrderView extends StatelessWidget {
  const TransferOrderView(this.order, {super.key});
  final Order order;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;
    return GetBuilder<TransferOrderController>(
        init: TransferOrderController(ordersUseCase: OrdersUseCase.instance, order: order),
        builder: (controller) {
          final order = controller.order;
          return GestureDetector(
            onTap: () => context.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                leading: const CloseButton(),
                title: const Text('Transfer Order'),
              ),
              bottomNavigationBar: Container(
                // color: Theme.of(context).appBarTheme.backgroundColor,
                padding: EdgeInsets.only(
                    bottom: bottomViewPadding == 0 ? 12 : bottomViewPadding,
                    left: 24,
                    right: 24),
                child: Obx(() {
                  return FilledButton(
                      onPressed: controller.selectedCustomer.value != null
                          ? () async => await controller.updateOrder(context)
                          : null,
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ));
                }),
              ),
              body: SafeArea(
                  child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: [
                  AlternativeOrderCard(order, onTap: null),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FulfillmentStatusLabel(
                          fulfillmentStatus: order.fulfillmentStatus),
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
                      final result = await context.pushRoute(PickCustomerRoute(
                        pickCustomerReq: PickCustomerReq(
                            disabledCustomers: [order.customer!])
                      ));
                      if (result is PickCustomerRes) {
                        controller.selectedCustomer.value =
                            result.selectedCustomers.first;
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
        });
  }
}
