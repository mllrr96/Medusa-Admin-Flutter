import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

class PromotionTypeLabel extends StatelessWidget {
  const PromotionTypeLabel({super.key, required this.discount});
  final Promotion discount;
  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorManager.primary.withValues(alpha: 0.17);
    Color textColor = ColorManager.primary;
    String text = 'Upcoming';
    final valueText = discount.code;
    switch (discount.type) {
      case PromotionType.buyget:
        containerColor = Colors.orangeAccent.withValues(alpha: 0.17);
        textColor = Colors.orangeAccent;
        // text = discount.rule?.value.formatAsPrice(discount.regions.firstOrNull?.currencyCode) ?? '';
        break;
      case PromotionType.standard:
        containerColor = Colors.blueAccent.withValues(alpha: 0.17);
        textColor = Colors.blueAccent;
        text = '${valueText ?? ''} %';
        break;
      // case PromotionType.freeShipping:
      //   containerColor = Colors.green.withValues(alpha: 0.17);
      //   textColor = Colors.green;
      //   text = 'Free shipping';
      //   break;
      case null:
        // TODO: Handle this case.
        throw UnimplementedError();
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

class PromotionStatusDot extends StatelessWidget {
  const PromotionStatusDot({super.key, required this.disabled});
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    Color circleColor = ColorManager.primary;
    Color outerCircleColor = ColorManager.primary.withValues(alpha: 0.17);
    String text = 'Disabled';

    if (disabled) {
      circleColor = Colors.grey.withValues(alpha: 0.17);
      outerCircleColor = Colors.grey;
      text = 'Disabled';
    } else {
      circleColor = Colors.green.withValues(alpha: 0.17);
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
