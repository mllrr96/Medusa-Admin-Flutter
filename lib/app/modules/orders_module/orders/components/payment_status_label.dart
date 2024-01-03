import 'package:flutter/material.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../core/utils/colors.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class PaymentStatusLabel extends StatelessWidget {
  const PaymentStatusLabel({super.key, required this.paymentStatus, this.dotOnly = false});
  final PaymentStatus paymentStatus;
  final bool dotOnly;
  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorManager.primary.withOpacity(0.17);
    Color textColor = ColorManager.primary;
    String text = 'Upcoming';
    switch (paymentStatus) {
      case PaymentStatus.awaiting:
        containerColor = ColorManager.primary.withOpacity(0.17);
        textColor = ColorManager.primary;
        text = 'Awaiting Payment';
        break;
      case PaymentStatus.canceled:
        containerColor = Colors.red.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Canceled';
        break;
      case PaymentStatus.captured:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = '   Paid   ';
        break;
      case PaymentStatus.refunded:
        containerColor = Colors.blueAccent.withOpacity(0.17);
        textColor = Colors.blueAccent;
        text = 'Refunded';
        break;
      case PaymentStatus.requiresAction:
        containerColor = Colors.orangeAccent.withOpacity(0.17);
        textColor = Colors.orangeAccent;
        text = 'Requires Action';
        break;
      case PaymentStatus.notPaid:
        containerColor = Colors.deepOrange.withOpacity(0.17);
        textColor = Colors.deepOrange;
        text = 'Not Paid';
        break;
      case PaymentStatus.partiallyRefunded:
        containerColor = Colors.cyan.withOpacity(0.17);
        textColor = Colors.cyan;
        text = 'Partially Refunded';
        break;
    }

    if(dotOnly){
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Icon(Icons.circle, color: textColor, size: 10),
          Icon(Icons.circle, color: containerColor, size: 24),
        ],
      );
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

