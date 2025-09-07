import 'package:medusa_admin/src/core/extensions/context_extension.dart';import 'package:medusa_admin/src/core/extensions/num_extension.dart';import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class DraftOrderPayment extends StatelessWidget{
  const DraftOrderPayment(this.draftOrder, {super.key, this.markAsPaid});
  final DraftOrder draftOrder;
  final void Function()? markAsPaid;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    const halfSpace = Gap(6);
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final currencyCode = draftOrder.region?.currencyCode;

    return FlexExpansionTile(
      onExpansionChanged: (expanded) async {
        if (expanded && key is GlobalKey) {
          await (key as GlobalKey).currentContext.ensureVisibility();
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Payment'),
      trailing: draftOrder.status == 'open'
          ? TextButton(
              onPressed: () async {
                await showOkCancelAlertDialog(
                  context: context,
                  title: 'Mark as paid',
                  message:
                      'This will create an order. Mark this as paid if you received the payment.',
                  okLabel: 'Mark paid',
                  cancelLabel: 'Cancel',
                ).then((value) async {
                  if (value == OkCancelResult.ok) {
                    markAsPaid?.call();
                  }
                });
              },
              child: const Text('Mark as paid'))
          : null,
      childPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: mediumTextStyle),
                Row(
                  children: [
                    Text(
                        draftOrder.subtotal.formatAsPrice(currencyCode) ??
                            '',
                        style: mediumTextStyle),
                    // Text(' ${draftOrder.currencyCode?.toUpperCase() ?? ''}',
                    //     style: mediumTextStyle?.copyWith(color: manatee)),
                  ],
                ),
              ],
            ),
          ),
          halfSpace,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping', style: mediumTextStyle),
                Text(
                    draftOrder.shippingTotal
                            .formatAsPrice(currencyCode),
                    style: mediumTextStyle),
              ],
            ),
          ),
          halfSpace,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax', style: mediumTextStyle),
                Text(
                    draftOrder.taxTotal.formatAsPrice(currencyCode),
                    style: mediumTextStyle),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: largeTextStyle),
                Text(draftOrder.total.formatAsPrice(currencyCode) ?? '',
                    style: largeTextStyle),
              ],
            ),
          ),
          space,
          Text('Payment link : Configure payment link in store settings',
              style: smallTextStyle?.copyWith(color: manatee)),
        ],
      ),
    );
  }
}
