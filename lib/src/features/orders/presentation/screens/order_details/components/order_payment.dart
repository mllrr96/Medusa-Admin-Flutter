import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/features/orders/presentation/screens/orders/components/payment_status_label.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class OrderPayment extends StatelessWidget {
  const OrderPayment(this.order, {super.key, this.onExpansionChanged});
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    // final refunded = order.refunds != null && order.refunds!.isNotEmpty;
    const space = Gap(12);
    const halfSpace = Gap(6);
    final tr = context.tr;
    final mediumTextStyle = context.bodyMedium;
    const manatee = ColorManager.manatee;
    final largeTextStyle = context.bodyLarge;
    Widget? getButton() {
      switch (order.paymentStatus) {
        case PaymentStatus.refunded:
          return TextButton(
            // onPressed: () async => await controller.capturePayment(),
            onPressed: () {},
            child: Text(tr.templatesCapturePayment),
          );
        case PaymentStatus.notPaid:
        case PaymentStatus.awaiting:
        case PaymentStatus.partiallyRefunded:
        case PaymentStatus.captured:
        // return TextButton(
        //   onPressed: () async {
        //     final result = await showBarModalBottomSheet(
        //         context: context,
        //         backgroundColor: context.theme.scaffoldBackgroundColor,
        //         builder: (context) => OrderCreateRefund(order));
        //     if (result is CreateRefundOrdersReq) {
        //       // await controller.createRefund(result);
        //     }
        //   },
        //   child: Text(tr.templatesRefund),
        // );
        case PaymentStatus.canceled:
          break;
        case PaymentStatus.requiresAction:
          break;
        case PaymentStatus.authorized:
        case PaymentStatus.partiallyAuthorized:
        case PaymentStatus.partiallyCaptured:

        case null:
      }
      return null;
    }

    return FlexExpansionTile(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(tr.detailsPayment),
      trailing: getButton(),
      childPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child:
                      PaymentStatusLabel(paymentStatus: order.paymentStatus!)),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '',
                          // order.payments!.first.id!,
                          style: mediumTextStyle,
                        ),
                        halfSpace,
                        // if ((order.payments?.isNotEmpty ?? false) &&
                        //     order.payments?.first.capturedAt != null)
                        //   Text(
                        //       'on ${order.payments?.first.capturedAt.formatDate()} at ${order.payments?.first.capturedAt.formatTime()}',
                        //       style: mediumTextStyle!.copyWith(color: manatee)),
                      ],
                    ),
                  ),
                  // Text(
                  //     order.payments?.first.amount
                  //             .formatAsPrice(order.currencyCode) ??
                  //         '',
                  //     style: largeTextStyle),
                ],
              ),
              space,
              // if (refunded)
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         children: [
              //           const SizedBox(width: 12.0),
              //           const Icon(Icons.double_arrow_rounded),
              //           Text(
              //             tr.detailsRefunded,
              //             style: mediumTextStyle,
              //           ),
              //         ],
              //       ),
              //       Text(
              //           '- ${order.refundedTotal.formatAsPrice(order.currencyCode)}',
              //           style: mediumTextStyle),
              //     ],
              //   ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr.detailsTotalPaid, style: largeTextStyle),
              // Text(
              //     (refunded
              //             ? order.refundableAmount
              //             : order.payments?.first.amount)
              //         .formatAsPrice(order.currencyCode),
              //     style: largeTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
