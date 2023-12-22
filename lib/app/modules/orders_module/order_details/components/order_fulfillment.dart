import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../../../../data/models/store/index.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../orders/components/fulfillment_label.dart';

class OrderFulfillment extends GetView<OrderDetailsController> {
  const OrderFulfillment(this.order, {super.key, this.onExpansionChanged});
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final tr = context.tr;
    return CustomExpansionTile(
      key: controller.fulfillmentKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      childrenPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      title: Text(tr.detailsFulfillment),
      trailing: order.fulfillmentStatus == FulfillmentStatus.fulfilled ||
              order.fulfillmentStatus == FulfillmentStatus.shipped
          ? null
          : AdaptiveButton(
              onPressed: () async {
                final result = await context
                    .pushRoute(OrderCreateFulfillmentRoute(order: order));
                if (result is List<LineItem>) {
                  await controller.createFulfillment(result);
                }
              },
              padding: EdgeInsets.zero,
              child: Text(tr.detailsCreateFulfillment),
            ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tr.detailsShippingMethod,
                style: mediumTextStyle!.copyWith(color: lightWhite)),
            FulfillmentStatusLabel(fulfillmentStatus: order.fulfillmentStatus),
          ],
        ),
        if (order.shippingMethods == null)
          Text(tr.giftCardTableNone, style: mediumTextStyle),
        if (order.shippingMethods != null)
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.shippingMethods!.length,
              itemBuilder: (context, index) => Text(
                  order.shippingMethods![index].shippingOption?.name ?? '',
                  style: mediumTextStyle)),
        if (order.fulfillments != null && order.fulfillments!.isNotEmpty)
          const Divider(),
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
                    ? tr.templatesFulfillmentHasBeenCanceled
                    : 'Fulfillment #${index + 1} fulfilled by ${fulfillment.providerId}'),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (canceled)
                      Text(
                          'at ${fulfillment.canceledAt.formatDate()}, ${fulfillment.canceledAt.formatTime()}',
                          style: smallTextStyle),
                    if (canceled) const SizedBox(height: 6.0),
                    Text(
                        shipped ? tr.templatesTracking : tr.templatesNotShipped,
                        style: smallTextStyle?.copyWith(color: lightWhite)),
                  ],
                ),
                trailing: canceled || shipped
                    ? null
                    : AdaptiveIcon(
                        onPressed: () async {
                          await showModalActionSheet<int>(
                              context: context,
                              actions: <SheetAction<int>>[
                                SheetAction(
                                    label: tr.templatesMarkShipped, key: 0),
                                SheetAction(
                                    label: tr.templatesCancelFulfillment,
                                    isDestructiveAction: true,
                                    key: 1),
                              ]).then((val) async {
                            switch (val) {
                              case 0:
                                await controller.createOrderShipment(
                                    fulfillmentId: fulfillment.id!);
                                break;
                              case 1:
                                await showOkCancelAlertDialog(
                                  context: context,
                                  title: tr.templatesCancelFulfillment,
                                  message: tr
                                      .templatesAreYouSureYouWantToCancelTheFulfillment,
                                  okLabel: tr.newYesCancel,
                                  isDestructiveAction: true,
                                ).then((value) async {
                                  if (value == OkCancelResult.ok) {
                                    await controller
                                        .cancelFulfillment(fulfillment.id!);
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
