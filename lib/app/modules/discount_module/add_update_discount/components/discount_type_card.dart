import 'package:flutter/material.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/discount_rule.dart';

class DiscountTypeCard extends StatelessWidget {
  const DiscountTypeCard(
      {Key? key, required this.discountType, this.onTap, required this.groupValue, this.disabled = false})
      : super(key: key);
  final DiscountRuleType discountType;
  final DiscountRuleType? groupValue;
  final void Function(DiscountRuleType discountRuleType)? onTap;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    String title = '';
    String description = '';
    switch (discountType) {
      case DiscountRuleType.fixed:
        title = 'Fixed amount';
        description = 'Discount in whole numbers';
        break;
      case DiscountRuleType.percentage:
        title = 'Percentage';
        description = 'Discount applied in %';
        break;
      case DiscountRuleType.freeShipping:
        title = 'Free shipping';
        description = 'Override delivery amount';
        break;
    }

    final borderColor = groupValue == discountType ? ColorManager.primary : Colors.transparent;
    final selected = discountType == groupValue;
    return InkWell(
      onTap: () {
        if (onTap != null && !disabled) {
          onTap!(discountType);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius:
                selected ? const BorderRadius.all(Radius.circular(10)) : const BorderRadius.all(Radius.circular(4)),
            color: disabled ? manatee.withOpacity(0.3) : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: borderColor,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Radio<DiscountRuleType>(
                      value: discountType,
                      groupValue: groupValue,
                      onChanged: (val) {
                        if (val != null) {
                          if (onTap != null && !disabled) {
                            onTap!(discountType);
                          }
                        }
                      }),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: mediumTextStyle?.copyWith(color: disabled ? manatee : null)),
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
            if (disabled) const Icon(Icons.lock)
          ],
        ),
      ),
    );
  }
}
