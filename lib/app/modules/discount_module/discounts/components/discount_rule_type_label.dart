import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/discount_rule.dart';

class DiscountRuleTypeLabel extends StatelessWidget {
  const DiscountRuleTypeLabel({Key? key, required this.discount}) : super(key: key);
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorManager.primary.withOpacity(0.17);
    Color textColor = ColorManager.primary;
    String text = 'Upcoming';
    final valueText = discount.rule!.value;
    var value = discount.rule!.value!.roundToDouble();
    final valueFormatter = NumberFormat.currency(name: discount.regions!.first.currencyCode!);
    if (valueFormatter.decimalDigits != null) {
      value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
    }
    switch (discount.rule!.type!) {
      case DiscountRuleType.fixed:
        containerColor = Colors.orangeAccent.withOpacity(0.17);
        textColor = Colors.orangeAccent;
        text =
            '${discount.regions?.first.currencyCode?.toUpperCase() ?? ''} ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]}';
        break;
      case DiscountRuleType.percentage:
        containerColor = Colors.blueAccent.withOpacity(0.17);
        textColor = Colors.blueAccent;
        text = '${valueText ?? ''} %';
        break;
      case DiscountRuleType.freeShipping:
        containerColor = Colors.red.withOpacity(0.17);
        textColor = Colors.red;
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
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: textColor),
      ),
    );
  }
}

class DiscountStatusDot extends StatelessWidget {
  const DiscountStatusDot({Key? key, required this.disabled}) : super(key: key);
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;

    Color containerColor = ColorManager.primary.withOpacity(0.17);
    Color textColor = ColorManager.primary;
    if (disabled) {
      containerColor = Colors.grey.withOpacity(0.17);
      textColor = Colors.grey;
    } else {
      containerColor = Colors.green.withOpacity(0.17);
      textColor = Colors.green;
    }

    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Icon(Icons.circle, color: textColor, size: 12),
            Icon(Icons.circle, color: containerColor, size: 24),
          ],
        ),
        Text(disabled ? 'Disabled' : 'Active', style: smallTextStyle),
      ],
    );
  }
}
