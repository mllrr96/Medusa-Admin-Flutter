import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

class ShippingOptionLabel extends StatelessWidget {
  const ShippingOptionLabel({super.key, required this.adminOnly});
  final bool adminOnly;
  @override
  Widget build(BuildContext context) {
    Color containerColor = const Color(0xffCCFBF1).withValues(alpha: 0.17);
    Color textColor = const Color(0xff0EBA81);
    String text = 'Store';

    if (adminOnly) {
      text = 'Admin';
      containerColor = Colors.grey.withValues(alpha: 0.17);
      textColor = Colors.grey;
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
