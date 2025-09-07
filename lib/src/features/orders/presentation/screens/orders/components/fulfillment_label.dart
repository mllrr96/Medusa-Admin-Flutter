import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

import 'package:medusa_admin/src/core/constants/colors.dart';

class FulfillmentStatusLabel extends StatelessWidget {
  const FulfillmentStatusLabel({super.key, required this.fulfillmentStatus});
  final FulfillmentStatus fulfillmentStatus;
  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorManager.primary.withOpacity(0.17);
    Color textColor = ColorManager.primary;
    String text = 'Upcoming';
    switch (fulfillmentStatus) {
      case FulfillmentStatus.canceled:
        containerColor = Colors.red.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Canceled';
        break;
      // case FulfillmentStatus.requiresAction:
      //   containerColor = Colors.orangeAccent.withOpacity(0.17);
      //   textColor = Colors.orangeAccent;
      //   text = 'Requires Action';
      //   break;
      case FulfillmentStatus.notFulfilled:
        containerColor = Colors.deepOrange.withOpacity(0.17);
        textColor = Colors.deepOrange;
        text = 'Awaiting Fulfillment';
        break;
      case FulfillmentStatus.partiallyFulfilled:
        containerColor = Colors.orange.withOpacity(0.17);
        textColor = Colors.orange;
        text = 'Partially Fulfilled';
        break;
      case FulfillmentStatus.fulfilled:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Fulfilled';
        break;
      case FulfillmentStatus.partiallyShipped:
        containerColor = Colors.orange.withOpacity(0.17);
        textColor = Colors.orange;
        text = 'Partially Shipped';
        break;
      case FulfillmentStatus.shipped:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Shipped';
        break;
      case FulfillmentStatus.partiallyDelivered:
        containerColor = Colors.orange.withOpacity(0.17);
        textColor = Colors.orange;
        text = 'Partially Returned';
        break;
      case FulfillmentStatus.delivered:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Returned';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: context.bodySmall?.copyWith(color: textColor),
      ),
    );
  }
}
