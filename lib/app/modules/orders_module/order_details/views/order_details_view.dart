import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/components/order_create_fulfillment.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/fulfillment_label.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../../../../data/models/store/order.dart';
import '../../orders/components/payment_status_label.dart';
import '../components/order_components_index.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const halfSpace = SizedBox(height: 6.0);
    const space = SizedBox(height: 12.0);
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;

    Widget buildFulfillmentExpansionTile(Order order) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.leading,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            title: const Text('Fulfillment'),
            trailing: order.fulfillmentStatus != FulfillmentStatus.fulfilled
                ? AdaptiveButton(
                    onPressed: () => Get.to(OrderCreateFulfillment(order: order), fullscreenDialog: true),
                    padding: EdgeInsets.zero,
                    child: const Text('Create Fulfillment'),
                  )
                : null,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping method', style: mediumTextStyle!.copyWith(color: lightWhite)),
                  FulfillmentStatusLabel(fulfillmentStatus: order.fulfillmentStatus),
                ],
              ),
              if (order.shippingMethods == null) Text('None', style: mediumTextStyle),
              if (order.shippingMethods != null)
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: order.shippingMethods!.length,
                    itemBuilder: (context, index) =>
                        Text(order.shippingMethods![index].shippingOption?.name ?? '', style: mediumTextStyle)),
              // Text(order)
            ],
          ),
        ),
      );
    }

    Widget buildCustomerExpansionTile(Order order) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Customer'),
            trailing: IconButton(
                onPressed: () async {
                  await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                    const SheetAction(label: 'Go to Customer', icon: Icons.person, key: 0),
                    const SheetAction(label: 'Transfer Ownership', key: 1),
                    const SheetAction(label: 'Edit Shipping Address', key: 2),
                    const SheetAction(label: 'Edit Billing Address', key: 3),
                    const SheetAction(label: 'Edit Email Address', key: 4),
                  ]).then((value) async {
                    if (value == null) return;
                    switch (value) {
                      case 0:
                        await Get.toNamed(Routes.CUSTOMER_DETAILS, arguments: order.customerId!);
                        break;
                      case 1:
                        await Get.toNamed(Routes.TRANSFER_ORDER, arguments: order.id!);
                        break;
                    }
                  });
                },
                icon: const Icon(Icons.more_horiz)),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(child: Text(order.email![0])),
                        const SizedBox(width: 14.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${order.shippingAddress?.firstName ?? ''} ${order.shippingAddress?.lastName ?? ''}',
                                  style: mediumTextStyle),
                              Text(
                                  '${order.shippingAddress?.province ?? ''}, ${order.shippingAddress?.countryCode?.toUpperCase() ?? ''}',
                                  style: mediumTextStyle)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.email!, style: Theme.of(context).textTheme.titleMedium),
                        if (order.billingAddress != null && order.billingAddress!.phone != null)
                          Text(order.billingAddress!.phone.toString(), style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipping', style: mediumTextStyle!.copyWith(color: lightWhite)),
                        const SizedBox(height: 5.0),
                        Text('${order.shippingAddress?.address1 ?? ''} ${order.shippingAddress?.address2 ?? ''}',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(
                            '${order.shippingAddress?.postalCode ?? ''} ${order.shippingAddress?.province ?? ''} ${order.shippingAddress?.countryCode ?? ''}',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Billing', style: mediumTextStyle.copyWith(color: lightWhite)),
                        const SizedBox(height: 5.0),
                        Text('${order.billingAddress?.address1 ?? ''} ${order.billingAddress?.address2 ?? ''}',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(
                            '${order.billingAddress?.postalCode ?? ''} ${order.billingAddress?.province ?? ''} ${order.billingAddress?.countryCode ?? ''}',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buildPaymentExpansionTile(Order order) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Payment'),
            trailing: AdaptiveButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: const Text('Refund'),
            ),
            // : CupertinoButton(
            //     padding: EdgeInsets.zero, child: const Text('Refund', style: TextStyle(fontSize: 14)), onPressed: () {}),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.payments!.first.id!,
                    style: mediumTextStyle,
                  ),
                  halfSpace,
                  if (order.payments != null && order.payments!.isNotEmpty && order.payments!.first.capturedAt != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                              'on ${DateFormat.MEd().format(order.payments!.first.capturedAt!)} at ${DateFormat.jm().format(order.payments!.first.capturedAt!)}',
                              style:
                                  mediumTextStyle!.copyWith(color: Get.isDarkMode ? Colors.white54 : Colors.black54)),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: PaymentStatusLabel(paymentStatus: order.paymentStatus)),
                      ],
                    )
                ],
              ),
              // space,
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: mediumTextStyle!.copyWith(fontSize: 20)),
                  Text(order.payments!.first.amount!.toString(), style: mediumTextStyle.copyWith(fontSize: 20))
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget buildOrderOverview(Order order) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('#${order.displayId!}', style: Theme.of(context).textTheme.titleLarge),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.copy, size: 14))
                      ],
                    ),
                    if (order.cart != null && order.cart!.completedAt != null)
                      Text(
                        'on ${DateFormat.MEd().format(order.cart!.completedAt!)} at ${DateFormat.jm().format(order.cart!.completedAt!)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Order Status', style: smallTextStyle!.copyWith(color: lightWhite)),
                    const SizedBox(height: 6.0),
                    OrderStatusLabel(orderStatus: order.status),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.email!, style: Theme.of(context).textTheme.titleMedium),
                      if (order.billingAddress != null && order.billingAddress!.phone != null)
                        Text(order.billingAddress!.phone.toString(), style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Payment', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey)),
                    Text('Manual', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget buildSummeryExpansionTile(Order order) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Summery'),
              trailing: AdaptiveButton(onPressed: () {}, padding: EdgeInsets.zero, child: const Text('Edit Order')),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: order.items!.length,
                    itemBuilder: (context, index) => OrderSummeryCard(order: order, index: index)),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: mediumTextStyle),
                        Row(
                          children: [
                            Text(order.currency!.symbol!, style: mediumTextStyle),
                            Text(order.subTotal!.toString(), style: mediumTextStyle),
                            Text(' ${order.currency!.code!.toUpperCase()}', style: mediumTextStyle),
                          ],
                        ),
                      ],
                    ),
                    halfSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping', style: mediumTextStyle),
                        Row(
                          children: [
                            Text(order.currency!.symbol!, style: mediumTextStyle),
                            Text(order.shippingTotal!.toString(), style: mediumTextStyle),
                            Text(' ${order.currency!.code!.toUpperCase()}', style: mediumTextStyle),
                          ],
                        ),
                      ],
                    ),
                    if (order.taxTotal != null && order.taxTotal! != 0) halfSpace,
                    if (order.taxTotal != null && order.taxTotal! != 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tax', style: mediumTextStyle),
                          Row(
                            children: [
                              Text(order.currency!.symbol!, style: mediumTextStyle),
                              Text(order.taxTotal!.toString(), style: mediumTextStyle),
                              Text(' ${order.currency!.code!.toUpperCase()}', style: mediumTextStyle),
                            ],
                          ),
                        ],
                      ),
                    halfSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: mediumTextStyle!.copyWith(fontSize: 25)),
                        Row(
                          children: [
                            Text(order.currency!.symbol!, style: mediumTextStyle.copyWith(fontSize: 25)),
                            Text(order.total!.toString(), style: mediumTextStyle.copyWith(fontSize: 25)),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ]),
        ),
      );
    }

    Widget buildTimelineExpansionTile(Order order) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Timeline'),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          ),
        ),
      );
    }

    return GetBuilder<OrderDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: const Text('Order Details'),
            centerTitle: true,
            actions: [
              if (controller.state != null)
                AdaptiveButton(
                  onPressed: controller.state!.status != OrderStatus.canceled
                      ? () async {
                          final order = controller.state!;
                          await showTextAnswerDialog(
                            title: 'Cancel order',
                            message:
                                'Are you sure you want to cancel the order? \n Type the name "order #${order.displayId!}" to confirm.',
                            retryMessage:
                                'Make sure to type the name "order #${order.displayId!}" to confirm order deletion.',
                            retryOkLabel: 'Retry',
                            context: context,
                            keyword: 'order #${order.displayId!}',
                            isDestructiveAction: true,
                            hintText: 'order #${order.displayId!}',
                            okLabel: 'Yes, confirm',
                          ).then((value) async {
                            if (value) {
                              await controller.cancelOrder();
                            }
                          });
                        }
                      : null,
                  child: const Text('Cancel'),
                ),
            ],
          ),
          body: SafeArea(
            child: controller.obx(
              (order) => ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                children: [
                  buildOrderOverview(order!),
                  space,
                  buildSummeryExpansionTile(order),
                  space,
                  buildPaymentExpansionTile(order),
                  space,
                  buildFulfillmentExpansionTile(order),
                  space,
                  buildCustomerExpansionTile(order),
                  space,
                  buildTimelineExpansionTile(order),
                ],
              ),
              onEmpty: const Center(child: Text('No order details found')),
              onError: (e) => Center(child: Text(e ?? 'Error loading order details')),
              onLoading: const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        );
      },
    );
  }
}
