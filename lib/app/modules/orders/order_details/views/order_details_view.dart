import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/bottom_nav_bar_button.dart';

import '../../../../data/models/store/order.dart';
import '../../components/order_card.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return GetBuilder<OrderDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order Details'),
            centerTitle: true,
            actions: [
              if (GetPlatform.isIOS) CupertinoButton(child: const Text('Edit Order'), onPressed: () {}),
              if (GetPlatform.isAndroid) TextButton(child: const Text('Edit Order'), onPressed: () {})
            ],
          ),
          bottomNavigationBar: BottomNavigationBarButton(
              onPress: controller.state != null
                  ? () async {
                      final order = controller.state!;
                      final result = await showTextAnswerDialog(
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
                      );
                      if (result) {
                        // Delete order
                      }
                    }
                  : null,
              label: 'Cancel Order',
              buttonColor: Colors.redAccent),
          body: SafeArea(
            child: controller.obx(
              (order) => ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                children: [
                  buildOrderOverview(context, order!),
                  space,
                  buildSummeryExpansionTile(order, mediumTextStyle!),
                  space,
                  ExpansionTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Payment'),
                    trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                  ),
                  space,
                  ExpansionTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Fulfillment'),
                    trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                  ),
                  space,
                  ExpansionTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Customer'),
                    trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                  ),
                  space,
                  ExpansionTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Timeline'),
                    trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                  ),
                ],
              ),
              onEmpty: const Center(child: Text('No order details found')),
              onError: (e) => const Center(child: Text('Error loading order details')),
              onLoading: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        );
      },
    );
  }

  Container buildOrderOverview(BuildContext context, Order? order) {
    print(order?.billingAddress?.toJson());
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
                      Text('#${order!.displayId!}', style: Theme.of(context).textTheme.titleLarge),
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
              OrderStatusLabel(orderStatus: order.status),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.email!, style: Theme.of(context).textTheme.titleMedium),
                  if (order.billingAddress != null)
                    Text(order.billingAddress!.phone.toString(), style: Theme.of(context).textTheme.titleMedium),
                ],
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

  ExpansionTile buildSummeryExpansionTile(Order order, TextStyle mediumTextStyle) {
    const space = SizedBox(height: 5.0);
    return ExpansionTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: const Text('Summery'),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.items!.length,
              itemBuilder: (context, index) {
                final item = order.items![index];
                return ListTile(
                  leading: SizedBox(height: 50, width: 50, child: CachedNetworkImage(imageUrl: item.thumbnail!)),
                  title: Text(item.title!),
                  subtitle: Text(
                    item.variant?.title ?? '',
                    style: mediumTextStyle.copyWith(fontSize: 14),
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(order.currency!.symbol.toString() + item.unitPrice!.toString(), style: mediumTextStyle),
                          Text(' x ${item.quantity!}', style: mediumTextStyle),
                        ],
                      ),
                      Text(order.currency!.symbol.toString() + item.total!.toString(), style: mediumTextStyle),
                    ],
                  ),
                );
              }),
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
              space,
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
              if (order.taxTotal != null && order.taxTotal! != 0) space,
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
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: mediumTextStyle.copyWith(fontSize: 25)),
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
        ]);
  }
}
