import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class PaymentStatusLabel extends StatelessWidget {
  const PaymentStatusLabel(
      {super.key, required this.paymentStatus, this.dotOnly = false});
  final PaymentStatus paymentStatus;
  final bool dotOnly;
  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorManager.primary.withValues(alpha: 0.17);
    Color textColor = ColorManager.primary;
    String text = 'Upcoming';
    switch (paymentStatus) {
      case PaymentStatus.awaiting:
        containerColor = ColorManager.primary.withValues(alpha: 0.17);
        textColor = ColorManager.primary;
        text = 'Awaiting Payment';
        break;
      case PaymentStatus.canceled:
        containerColor = Colors.red.withValues(alpha: 0.17);
        textColor = Colors.redAccent;
        text = 'Canceled';
        break;
      case PaymentStatus.captured:
        containerColor = Colors.green.withValues(alpha: 0.17);
        textColor = Colors.green;
        text = '   Paid   ';
        break;
      case PaymentStatus.refunded:
        containerColor = Colors.blueAccent.withValues(alpha: 0.17);
        textColor = Colors.blueAccent;
        text = 'Refunded';
        break;
      case PaymentStatus.requiresAction:
        containerColor = Colors.orangeAccent.withValues(alpha: 0.17);
        textColor = Colors.orangeAccent;
        text = 'Requires Action';
        break;
      case PaymentStatus.notPaid:
        containerColor = Colors.deepOrange.withValues(alpha: 0.17);
        textColor = Colors.deepOrange;
        text = 'Not Paid';
        break;
      case PaymentStatus.partiallyRefunded:
        containerColor = Colors.cyan.withValues(alpha: 0.17);
        textColor = Colors.cyan;
        text = 'Partially Refunded';
        break;
      case PaymentStatus.authorized:
        containerColor = Colors.cyan.withValues(alpha: 0.17);
        textColor = Colors.cyan;
        text = 'Authorized';
        break;
      case PaymentStatus.partiallyAuthorized:
        containerColor = Colors.cyan.withValues(alpha: 0.17);
        textColor = Colors.cyan;
        text = 'Partially Authorized';
        break;
      case PaymentStatus.partiallyCaptured:
        containerColor = Colors.cyan.withValues(alpha: 0.17);
        textColor = Colors.cyan;
        text = 'Partially Captured';
        break;
    }

    if (dotOnly) {
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
