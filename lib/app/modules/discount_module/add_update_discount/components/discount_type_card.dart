import 'package:flutter/material.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/discount_rule.dart';

class DiscountTypeCard extends StatelessWidget {
  const DiscountTypeCard(
      {super.key,
      required this.discountType,
      this.onTap,
      required this.groupValue,
      this.disabled = false});
  final DiscountRuleType discountType;
  final DiscountRuleType? groupValue;
  final void Function(DiscountRuleType discountRuleType)? onTap;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final Color background = theme.scaffoldBackgroundColor;

    // Compute a header color with fixed primary blend from the card color,
    // if one was not provided
    final selected = discountType == groupValue;
    double borderRadius = useMaterial3 ? 12 : 4;
    final ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      side: selected
          ? BorderSide(color: theme.colorScheme.primaryContainer, width: 1)
          : BorderSide.none,
    );
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

    return Card(
      shape: shapeBorder,
      elevation: 0,
      color: background,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (onTap != null && !disabled) {
            onTap!(discountType);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
                          Text(title,
                              style: mediumTextStyle?.copyWith(
                                  color: disabled ? manatee : null)),
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
      ),
    );
  }
}
