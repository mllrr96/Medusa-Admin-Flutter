import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';

class DiscountAllocationTypeDiscount extends StatelessWidget {
  const DiscountAllocationTypeDiscount({Key? key, required this.allocationType, required this.groupValue, this.onTap})
      : super(key: key);
  final AllocationType allocationType;
  final AllocationType? groupValue;
  final void Function(AllocationType allocationType)? onTap;

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    String title = '';
    String description = '';
    switch (allocationType) {
      case AllocationType.total:
        title = 'Total amount';
        description = 'Apply to the total amount';
        break;
      case AllocationType.item:
        title = 'Item specific';
        description = 'Apply to every allowed item';
        break;
    }
    final selected = allocationType == groupValue;
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(allocationType);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius:
                selected ? const BorderRadius.all(Radius.circular(10)) : const BorderRadius.all(Radius.circular(4)),
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(color: groupValue == allocationType ? ColorManager.primary : Colors.transparent)),
        child: Row(
          children: [
            Radio<AllocationType>(
                value: allocationType,
                groupValue: groupValue,
                onChanged: (val) {
                  if (val != null) {
                    if (onTap != null) {
                      onTap!(allocationType);
                    }
                  }
                }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: mediumTextStyle),
                Text(
                  description,
                  style: smallTextStyle?.copyWith(color: manatee),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
