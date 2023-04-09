import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class OrderSummeryCard extends StatelessWidget {
  const OrderSummeryCard({Key? key, required this.order, required this.index}) : super(key: key);
  final Order order;
  final int index;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final item = order.items![index];
    String itemPriceText() {
      var value = item.unitPrice?.roundToDouble() ?? 0;
      final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
    }

    String itemTotalText() {
      var value = item.total?.roundToDouble() ?? 0;
      final valueFormatter = NumberFormat.currency(name: order.currencyCode!);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${order.currency?.symbolNative ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: CachedNetworkImage(key: ValueKey(item.thumbnail), imageUrl: item.thumbnail!)),
          const SizedBox(width: 6.0),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    item.title!,
                    style: mediumTextStyle,
                  ),
                ),
                if (item.variant != null) const SizedBox(height: 6.0),
                Flexible(
                  child: Text(
                    item.variant?.title ?? '',
                    style: smallTextStyle,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(child: Text('${itemPriceText()} x ${item.quantity!}', style: smallTextStyle)),
                const Divider(height: 1),
                Flexible(child: Text(itemTotalText(), style: mediumTextStyle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
