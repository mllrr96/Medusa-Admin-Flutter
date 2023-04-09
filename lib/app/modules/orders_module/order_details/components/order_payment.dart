import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

import '../../../../data/models/store/order.dart';
import '../../../components/adaptive_button.dart';
import '../../orders/components/payment_status_label.dart';

class OrderPayment extends GetView<OrderDetailsController> {
  const OrderPayment(this.order, {Key? key}) : super(key: key);
final Order order;
  @override
  Widget build(BuildContext context) {

    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint = controller.scrollController.offset + yPosition - context.mediaQueryPadding.top - 56;
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        }
      });
    }
    String paymentTotal(Order order) {
      var value = order.payments?.first.amount?.roundToDouble() ?? 0;
      final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
    }

    const halfSpace = SizedBox(height: 6.0);
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return CustomExpansionTile(
      key: controller.paymentKey,
      onExpansionChanged: (expanded) async {
        if (expanded) {
          await scrollToSelectedContent(globalKey: controller.paymentKey);
        }
      },
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
                        style: mediumTextStyle!.copyWith(color: Get.isDarkMode ? Colors.white54 : Colors.black54)),
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
            Text(paymentTotal(order), style: mediumTextStyle.copyWith(fontSize: 20)),
          ],
        ),
      ],
    );
  }
}
