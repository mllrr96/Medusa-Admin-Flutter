import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/extension.dart';

import '../../../../../core/constant/colors.dart';

class DiscountRuleTypeLabel extends StatelessWidget {
  const DiscountRuleTypeLabel({super.key, required this.discount});
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorManager.primary.withOpacity(0.17);
    Color textColor = ColorManager.primary;
    String text = 'Upcoming';
    final valueText = discount.rule!.value;
    switch (discount.rule!.type!) {
      case DiscountRuleType.fixed:
        containerColor = Colors.orangeAccent.withOpacity(0.17);
        textColor = Colors.orangeAccent;
        text = discount.rule?.value.formatAsPrice(discount.regions?.first.currencyCode) ?? '';
        break;
      case DiscountRuleType.percentage:
        containerColor = Colors.blueAccent.withOpacity(0.17);
        textColor = Colors.blueAccent;
        text = '${valueText ?? ''} %';
        break;
      case DiscountRuleType.freeShipping:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Free shipping';
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

class DiscountStatusDot extends StatelessWidget {
  const DiscountStatusDot({super.key, required this.disabled});
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    Color circleColor = ColorManager.primary;
    Color outerCircleColor = ColorManager.primary.withOpacity(0.17);
    String text = 'Disabled';

    if (disabled) {
      circleColor = Colors.grey.withOpacity(0.17);
      outerCircleColor = Colors.grey;
      text = 'Disabled';
    } else {
      circleColor = Colors.green.withOpacity(0.17);
      outerCircleColor = Colors.green;
      text = 'Active';
    }
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Icon(Icons.circle, color: outerCircleColor, size: 12),
            Icon(Icons.circle, color: circleColor, size: 24),
          ],
        ),
        Text(text, style: smallTextStyle),
      ],
    );
  }
}
