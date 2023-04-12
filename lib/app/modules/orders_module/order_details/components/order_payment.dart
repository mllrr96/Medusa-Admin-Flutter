import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/components/index.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../data/models/req/user_order.dart';
import '../../../../data/models/store/order.dart';
import '../../../components/adaptive_button.dart';
import '../../orders/components/payment_status_label.dart';

class OrderPayment extends GetView<OrderDetailsController> {
  const OrderPayment(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final refunded = order.refunds != null && order.refunds!.isNotEmpty;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;

    Widget? getButton() {
      switch (order.paymentStatus) {
        case PaymentStatus.refunded:
          return AdaptiveButton(
            onPressed: () async => await controller.capturePayment(),
            padding: EdgeInsets.zero,
            child: const Text('Capture payment'),
          );
        case PaymentStatus.notPaid:
        case PaymentStatus.awaiting:
        case PaymentStatus.partiallyRefunded:
        case PaymentStatus.captured:
          return AdaptiveButton(
            onPressed: () async {
              final result =
                  await showBarModalBottomSheet(context: context, builder: (context) => OrderCreateRefund(order));
              if (result is UserCreateRefundOrdersReq) {
                await controller.createRefund(result);
              }
            },
            padding: EdgeInsets.zero,
            child: const Text('Refund'),
          );
        case PaymentStatus.canceled:
          break;
        case PaymentStatus.requiresAction:
          break;
      }
      return null;
    }

    return CustomExpansionTile(
      key: controller.paymentKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Payment'),
      trailing: getButton(),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerRight, child: PaymentStatusLabel(paymentStatus: order.paymentStatus)),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.payments!.first.id!,
                        style: mediumTextStyle,
                      ),
                      halfSpace,
                      if (order.payments != null &&
                          order.payments!.isNotEmpty &&
                          order.payments!.first.capturedAt != null)
                        Text(
                            'on ${DateFormat.MEd().format(order.payments!.first.capturedAt!)} at ${DateFormat.jm().format(order.payments!.first.capturedAt!)}',
                            style: mediumTextStyle!.copyWith(color: Get.isDarkMode ? Colors.white54 : Colors.black54)),
                    ],
                  ),
                ),
                Text(getPrice(order.payments?.first.amount), style: largeTextStyle),
              ],
            ),
            space,
            if (refunded)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 12.0),
                      const Icon(Icons.double_arrow_rounded),
                      Text(
                        'Refunded',
                        style: mediumTextStyle,
                      ),
                    ],
                  ),
                  Text('- ${getPrice(order.refundedTotal)}', style: mediumTextStyle),
                ],
              ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Paid', style: largeTextStyle),
            Text(getPrice(refunded ? order.refundableAmount : order.payments?.first.amount), style: largeTextStyle),
          ],
        ),
      ],
    );
  }

  String getPrice(num? price) {
    var value = price ?? 0;
    final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
    if (valueFormatter.decimalDigits != null) {
      value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
    }
    return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
  }
}
