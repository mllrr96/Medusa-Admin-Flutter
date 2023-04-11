import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/draft_order.dart';

class DraftOrderStatusLabel extends StatelessWidget {
  const DraftOrderStatusLabel(this.draftOrderStatus,{Key? key}) : super(key: key);
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
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: textColor),
      ),
    );
  }
}
