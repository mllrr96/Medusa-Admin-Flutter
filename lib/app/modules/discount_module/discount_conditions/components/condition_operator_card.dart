import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../../../core/utils/colors.dart';
import 'package:medusa_admin/core/utils/enums.dart';

class ConditionOperatorCard extends StatelessWidget {
  const ConditionOperatorCard(
      {Key? key,
      required this.conditionOperator,
      this.onTap,
      required this.groupValue})
      : super(key: key);
  final DiscountConditionOperator conditionOperator;
  final DiscountConditionOperator groupValue;
  final void Function(DiscountConditionOperator discountRuleType)? onTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
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
                      style: smallTextStyle?.copyWith(color: lightWhite),
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
