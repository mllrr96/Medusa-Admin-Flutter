import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class DraftOrderStatusLabel extends StatelessWidget {
  const DraftOrderStatusLabel(this.draftOrderStatus, {super.key});
  final DraftOrderStatus draftOrderStatus;
  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorManager.primary.withOpacity(0.17);
    Color textColor = ColorManager.primary;
    String text = 'Completed';
    switch (draftOrderStatus) {
      case DraftOrderStatus.open:
        containerColor = ColorManager.primary.withOpacity(0.17);
        textColor = ColorManager.primary;
        text = '   Open   ';
        break;
      case DraftOrderStatus.completed:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Completed';
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
        style: context.bodySmall?.copyWith(color: textColor),
      ),
    );
  }
}

class ShadDraftOrderStatusLabel extends StatelessWidget {
  const ShadDraftOrderStatusLabel(this.draftOrderStatus, {super.key});
  final DraftOrderStatus draftOrderStatus;
  @override
  Widget build(BuildContext context) {
    Color textColor = ColorManager.primary;
    String text = 'Completed';
    switch (draftOrderStatus) {
      case DraftOrderStatus.open:
        textColor = ColorManager.primary;
        text = 'Open';
        break;
      case DraftOrderStatus.completed:
        textColor = Colors.green;
        text = 'Completed';
        break;
    }

    return ShadBadge(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      backgroundColor: textColor,
      child: Text(text),
    );
  }
}
