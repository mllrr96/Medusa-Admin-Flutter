import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'custom_gift_card_tile.dart';


class CustomGiftCardsLoadingPage extends StatelessWidget {
  const CustomGiftCardsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final giftCard = GiftCard(
      code: 'MDBR-FSDK-DOEF',
      value: 1200,
      balance: 1200,
      regionId: '',
      orderId: '12345678',
      createdAt: DateTime(2021, 10, 10, 10, 10, 10),
    );
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
            19,
            (index) => index.isEven
                ? CustomGiftCardTile(giftCard)
                : const Divider(height: 0)),
      ),
    );
  }
}
