import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';
import 'order_status_label.dart';

class OrderOverview extends StatelessWidget {
  const OrderOverview({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final tr = context.tr;

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
                      Text('#${order.displayId!}', style: context.bodyLarge),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.copy, size: 14))
                    ],
                  ),
                  if ( order.cart?.completedAt != null)
                    Text(
                      'on ${order.cart!.completedAt.formatDate()} at ${order.cart!.completedAt.formatTime()}',
                      style: context.bodyMedium,
                    )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(tr.orderStatus, style: smallTextStyle!.copyWith(color: lightWhite)),
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
                    Text(order.email!, style: context.bodyMedium),
                    if (order.billingAddress != null && order.billingAddress!.phone != null)
                      Text(order.billingAddress!.phone.toString(), style: context.bodyMedium),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(tr.payment, style: context.bodyMedium?.copyWith(color: Colors.grey)),
                  if (order.payments?.isNotEmpty ?? false)
                    Text(order.payments!.first.providerId?.capitalize ?? '',
                        style: context.bodyMedium),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
