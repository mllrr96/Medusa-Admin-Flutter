import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class CustomGiftCardTile extends StatelessWidget {
  const CustomGiftCardTile(this.giftCard, {super.key, this.onToggle, this.onEdit, this.onTap});
  final GiftCard giftCard;
  final void Function()? onTap;
  final void Function()? onToggle;
  final void Function()? onEdit;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final isDisabled = giftCard.isDisabled;

    return ListTile(
      onTap: onTap,
      onLongPress: () async {
        await showModalActionSheet<int>(
            title: 'Manage Custom Gift Card',
            context: context,
            actions: <SheetAction<int>>[
              const SheetAction(label: 'Edit details', key: 0),
              SheetAction(
                  label: isDisabled ? 'Enable' : 'Disable',
                  isDestructiveAction: true,
                  key: 1),
            ]).then((value) async {
          switch (value) {
            case 0:
              onEdit?.call();
              break;
            case 1:
              onToggle?.call();
              break;
          }
        });
      },
      tileColor: context.theme.appBarTheme.backgroundColor,
      title: Text(giftCard.code ?? ''),
      subtitle: Text(
        giftCard.orderId ?? '_',
        style: smallTextStyle?.copyWith(color: manatee),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
              '${giftCard.balance.formatAsPrice(giftCard.region?.currencyCode, includeSymbol: false)} / ${giftCard.value.formatAsPrice(giftCard.region?.currencyCode, symbolAtEnd: true)}'),
          Text(giftCard.createdAt.formatDate()),
        ],
      ),
    );
  }
}
