import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import '../../../../data/models/store/index.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../orders/components/fulfillment_label.dart';
import 'order_create_fulfillment.dart';

class OrderFulfillment extends GetView<OrderDetailsController> {
  const OrderFulfillment(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return CustomExpansionTile(
      key: controller.fulfillmentKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      title: const Text('Fulfillment'),
      trailing:
          order.fulfillmentStatus == FulfillmentStatus.fulfilled || order.fulfillmentStatus == FulfillmentStatus.shipped
              ? null
              : AdaptiveButton(
                  onPressed: () async {
                    final result = await Get.to(() => OrderCreateFulfillment(order: order));
                    if (result is List<LineItem>) {
                      await controller.createFulfillment(result);
                    }
                  },
                  padding: EdgeInsets.zero,
                  child: const Text('Create Fulfillment'),
                ),
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
        if (order.fulfillments != null && order.fulfillments!.isNotEmpty) const Divider(),
        if (order.fulfillments != null)
          ListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.fulfillments!.length,
            itemBuilder: (context, index) {
              final fulfillment = order.fulfillments![index];
              final canceled = fulfillment.canceledAt != null;
              final shipped = fulfillment.shippedAt != null;
              return ListTile(
                isThreeLine: canceled,
                title: Text(canceled
                    ? 'Fulfillment has been canceled'
                    : 'Fulfillment #${index + 1} fulfilled by ${fulfillment.providerId}'),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (canceled)
                      Text(
                          'at ${DateFormat.yMMMEd().format(fulfillment.canceledAt!)}, ${DateFormat.jm().format(fulfillment.canceledAt!)}',
                          style: smallTextStyle),
                    if (canceled) const SizedBox(height: 6.0),
                    Text(shipped ? 'Tracking' : 'Not shipped', style: smallTextStyle?.copyWith(color: lightWhite)),
                  ],
                ),
                trailing: canceled || shipped
                    ? null
                    : AdaptiveIcon(
                        onPressed: () async {
                          await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                            const SheetAction(label: 'Mark Shipped', key: 0),
                            const SheetAction(label: 'Cancel Fulfillment', isDestructiveAction: true, key: 1),
                          ]).then((val) async {
                            switch (val) {
                              case 0:
                                await controller.createOrderShipment(fulfillmentId: fulfillment.id!);
                                break;
                              case 1:
                                await showOkCancelAlertDialog(
                                  context: context,
                                  title: 'Cancel fulfillment?',
                                  message: 'Are you sure you want to cancel the fulfillment?',
                                  okLabel: 'Yes, confirm',
                                  isDestructiveAction: true,
                                ).then((value) async {
                                  if (value == OkCancelResult.ok) {
                                    await controller.cancelFulfillment(fulfillment.id!);
                                  }
                                });
                                break;
                            }
                          });
                        },
                        icon: const Icon(Icons.more_horiz)),
              );
            },
          ),

        // Text(order)
      ],
    );
  }
}
