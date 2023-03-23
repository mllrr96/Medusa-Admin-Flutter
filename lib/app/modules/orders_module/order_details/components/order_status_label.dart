import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/order.dart';

class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({Key? key, required this.orderStatus}) : super(key: key);
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
      case OrderStatus.completed:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Completed';
        break;
      case OrderStatus.archived:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Archived';
        break;
      case OrderStatus.requiresAction:
        containerColor = Colors.red.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Require Action';
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
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: textColor),
      ),
    );
  }
}
