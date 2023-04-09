import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

import 'order_status_label.dart';

class OrderOverview extends StatelessWidget {
  const OrderOverview({Key? key, required this.order}) : super(key: key);
final Order order;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
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
                  if (order.payments?.isNotEmpty ?? false)
                    Text(order.payments!.first.providerId?.capitalize ?? '',
                        style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
