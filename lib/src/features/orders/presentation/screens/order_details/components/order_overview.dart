import 'package:flutter/material.dart';

import 'package:medusa_admin/src/core/extensions/context_extension.dart';import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'order_status_label.dart';

class OrderOverview extends StatelessWidget {
  const OrderOverview({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final tr = context.tr;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.theme.cardColor,
        // color: context.theme.cardColor,
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
                      Text('#${order.displayId ??''}', style: context.bodyLarge),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.copy, size: 14))
                    ],
                  ),
                  // if ( order.completedAt != null)
                  //   Text(
                  //     'on ${order.cart!.completedAt.formatDate()} at ${order.cart!.completedAt.formatTime()}',
                  //     style: context.bodyMedium,
                  //   )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(tr.customerOrdersTableStatus, style: smallTextStyle!.copyWith(color: manatee)),
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
                    Text(order.email ?? '', style: context.bodyMedium),
                    if (order.billingAddress != null && order.billingAddress!.phone != null)
                      Text(order.billingAddress!.phone.toString(), style: context.bodyMedium),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(tr.detailsPayment, style: context.bodyMedium?.copyWith(color: Colors.grey)),
                  // if (order.payments?.isNotEmpty ?? false)
                  //   Text(order.payments!.first.providerId!.capitalize,
                  //       style: context.bodyMedium),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
