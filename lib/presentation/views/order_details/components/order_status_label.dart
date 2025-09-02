import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import '../../../../../core/constant/colors.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({super.key, required this.orderStatus});
  final OrderStatus orderStatus;
  @override
  Widget build(BuildContext context) {
    var containerColor = ColorManager.primary.withOpacity(0.17);
    var textColor = ColorManager.primary;
    String text = 'Upcoming';
    switch (orderStatus) {
      case OrderStatus.pending:
        containerColor = ColorManager.primary.withOpacity(0.17);
        textColor = ColorManager.primary;
        text = 'Pending';
        break;
      case OrderStatus.canceled:
        containerColor = Colors.red.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Canceled';
        break;
      // case OrderStatus.completed:
      //   containerColor = Colors.green.withOpacity(0.17);
      //   textColor = Colors.green;
      //   text = 'Completed';
      //   break;
      // case OrderStatus.archived:
      //   containerColor = Colors.green.withOpacity(0.17);
      //   textColor = Colors.green;
      //   text = 'Archived';
      //   break;
      // case OrderStatus.requiresAction:
      //   containerColor = Colors.red.withOpacity(0.17);
      //   textColor = Colors.redAccent;
      //   text = 'Require Action';
      //   break;
      case OrderStatus.requested:
        // TODO: Handle this case.
        throw UnimplementedError();
      case OrderStatus.confirmed:
        // TODO: Handle this case.
        throw UnimplementedError();
      case OrderStatus.declined:
        // TODO: Handle this case.
        throw UnimplementedError();
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
