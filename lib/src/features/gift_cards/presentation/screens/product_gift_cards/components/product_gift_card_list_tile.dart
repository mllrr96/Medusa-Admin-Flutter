import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';

class GiftCardListTile extends StatelessWidget {
  const GiftCardListTile(
      {super.key,
      required this.giftCard,
      this.onToggle,
      this.onEdit,
      this.onDelete});
  final Product giftCard;
  final void Function()? onToggle;
  final void Function()? onEdit;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    final published = giftCard.status == ProductStatus.published;
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return ListTile(
        tileColor: context.theme.appBarTheme.backgroundColor,
        contentPadding: const EdgeInsets.only(left: 16.0),
        title: Text(giftCard.title ?? ''),
        subtitle: giftCard.description != null
            ? Text(
                giftCard.description!,
                style: smallTextStyle?.copyWith(color: manatee),
              )
            : null,
        trailing: IconButton(
            padding: const EdgeInsets.all(16.0),
            onPressed: () async {
              await showModalActionSheet<int>(
                  title: 'Manage gift card',
                  message: giftCard.title,
                  context: context,
                  actions: <SheetAction<int>>[
                    const SheetAction(label: 'Edit', key: 0),
                    SheetAction(
                        label: published ? 'Unpublish' : 'Publish', key: 1),
                    const SheetAction(
                        label: 'Delete', isDestructiveAction: true, key: 2),
                  ]).then((result) async {
                switch (result) {
                  case 0:
                    onEdit?.call();
                    break;
                  case 1:
                    onToggle?.call();
                    break;
                  case 2:
                    if (!context.mounted) return;
                    await showOkCancelAlertDialog(
                            context: context,
                            title: 'Confirm gift card deletion',
                            message:
                                'Are you sure you want to delete this gift card?',
                            isDestructiveAction: true)
                        .then((result) async {
                      if (result == OkCancelResult.ok) {
                        onDelete?.call();
                      }
                    });
                    break;
                }
              });
            },
            icon: const Icon(Icons.more_horiz)));
  }
}
