import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/gift_card.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'custom_gift_card_view.dart';

class CustomGiftCardTile extends StatelessWidget {
  const CustomGiftCardTile(this.giftCard, {super.key, this.onToggle});
  final GiftCard giftCard;
  final void Function()? onToggle;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final isDisabled = giftCard.isDisabled ?? false;

    return ListTile(
      onTap: () {
        showBarModalBottomSheet(
          context: context,
          builder: (context) => CustomGiftCardView(giftCard),
        );
      },
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
              context.pushRoute(
                  CreateUpdateCustomGiftCardRoute(giftCard: giftCard));
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
        style: smallTextStyle?.copyWith(color: lightWhite),
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
