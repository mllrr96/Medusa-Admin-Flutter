import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import 'order_summery_card.dart';

class OrderSummery extends GetView<OrderDetailsController> {
  const OrderSummery(this.order, {Key? key}) : super(key: key);

  String subtotalText() {
    var value = order.subTotal?.roundToDouble() ?? 0;
    final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
    if (valueFormatter.decimalDigits != null) {
      value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
    }
    return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
  }

  String shippingTotalText() {
    var value = order.shippingTotal?.roundToDouble() ?? 0;
    final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
    if (valueFormatter.decimalDigits != null) {
      value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
    }
    return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
  }

  String taxTotalText() {
    var value = order.taxTotal?.roundToDouble() ?? 0;
    final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
    if (valueFormatter.decimalDigits != null) {
      value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
    }
    return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
  }

  String totalText() {
    var value = order.total?.roundToDouble() ?? 0;
    final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
    if (valueFormatter.decimalDigits != null) {
      value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
    }
    return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
  }

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

    const halfSpace = SizedBox(height: 6.0);
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return CustomExpansionTile(
      key: controller.summeryKey,
      onExpansionChanged: (expanded) async {
        if (expanded) {
          await scrollToSelectedContent(globalKey: controller.summeryKey);
        }
      },
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
                    Text(subtotalText(), style: mediumTextStyle),
                    Text(' ${order.currencyCode?.toUpperCase() ?? ''}',
                        style: mediumTextStyle?.copyWith(color: lightWhite)),
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
                    Text(shippingTotalText(), style: mediumTextStyle),
                    Text(' ${order.currencyCode?.toUpperCase() ?? ''}',
                        style: mediumTextStyle?.copyWith(color: lightWhite)),
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
                      Text(taxTotalText(), style: mediumTextStyle),
                      Text(' ${order.currencyCode?.toUpperCase() ?? ''}',
                          style: mediumTextStyle?.copyWith(color: lightWhite)),
                    ],
                  ),
                ],
              ),
            halfSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: Theme.of(context).textTheme.displayLarge),
                Text(totalText(), style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            halfSpace,
          ],
        ),
      ],
    );
  }
}
