import 'package:flutter/material.dart';

import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import '../../../../../core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class ConditionOperatorCard extends StatelessWidget {
  const ConditionOperatorCard(
      {super.key,
      required this.conditionOperator,
      this.onTap,
      required this.groupValue});
  final DiscountConditionOperator conditionOperator;
  final DiscountConditionOperator groupValue;
  final void Function(DiscountConditionOperator discountRuleType)? onTap;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    String title = '';
    String description = '';
    switch (conditionOperator) {
      case DiscountConditionOperator.inn:
        title = 'In';
        description = 'Applies to the selected items.';
        break;
      case DiscountConditionOperator.notIn:
        title = 'Not in';
        description = 'Applies to all items except the selected items.';
        break;
    }

    final borderColor = groupValue == conditionOperator
        ? ColorManager.primary
        : Colors.transparent;
    final selected = conditionOperator == groupValue;
    final borderRadius =  selected
        ? const BorderRadius.all(Radius.circular(10))
        : const BorderRadius.all(Radius.circular(4));
    return Material(
      color: context.theme.appBarTheme.backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          if (onTap != null) {
            onTap!(conditionOperator);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: Border.all(
                color: borderColor,
              )),
          child: Row(
            children: [
              Radio<DiscountConditionOperator>(
                  value: conditionOperator,
                  groupValue: groupValue,
                  onChanged: (val) {
                    if (val != null) {
                      if (onTap != null) {
                        onTap!(conditionOperator);
                      }
                    }
                  }),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: mediumTextStyle),
                    Text(
                      description,
                      style: smallTextStyle?.copyWith(color: manatee),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
