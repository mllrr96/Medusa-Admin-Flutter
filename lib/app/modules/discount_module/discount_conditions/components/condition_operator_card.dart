import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount_condition.dart';

import '../../../../../../../core/utils/colors.dart';

class ConditionOperatorCard extends StatelessWidget {
  const ConditionOperatorCard({Key? key, required this.conditionOperator, this.onTap, required this.groupValue})
      : super(key: key);
  final DiscountConditionOperator conditionOperator;
  final DiscountConditionOperator groupValue;
  final void Function(DiscountConditionOperator discountRuleType)? onTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;

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

    final borderColor = groupValue == conditionOperator ? ColorManager.primary : Colors.transparent;

    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(conditionOperator);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).appBarTheme.backgroundColor,
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
    );
  }
}
