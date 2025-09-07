import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class DiscountTypeCard extends StatelessWidget {
  const DiscountTypeCard(
      {super.key,
      required this.discountType,
      this.onTap,
      required this.groupValue,
      this.disabled = false});
  final PromotionType discountType;
  final PromotionType? groupValue;
  final void Function(PromotionType discountRuleType)? onTap;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final bool useMaterial3 = context.theme.useMaterial3;
    final Color background = context.theme.scaffoldBackgroundColor;

    final selected = discountType == groupValue;
    double borderRadius = useMaterial3 ? 12 : 4;
    final ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      side: selected
          ? BorderSide(
              color: context.theme.colorScheme.primaryContainer, width: 1)
          : BorderSide.none,
    );
    String title = '';
    String description = '';
    switch (discountType) {
      case PromotionType.buyget:
        title = 'Buy get';
        description = 'Discount in whole numbers';
        break;
      case PromotionType.standard:
        title = 'Standard';
        description = 'Discount applied in %';
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
                    Radio<PromotionType>(
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
