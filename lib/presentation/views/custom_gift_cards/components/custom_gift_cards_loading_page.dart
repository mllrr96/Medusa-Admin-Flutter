import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'custom_gift_card_tile.dart';

class CustomGiftCardsLoadingPage extends StatelessWidget {
  const CustomGiftCardsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final giftCard = GiftCard(
      id: '',
      code: 'code',
      status: GiftCardStatus.pending,
      value: 10,
      currencyCode: '',
      customerId: '',
      customer: Customer(id: '', email: ''),
      referenceId: '',
      note: 'note',
      reference: 'reference',
      lineItem: LineItem(id: '', title: '', description: '', thumbnail: '', isGiftcard: false, quantity: 0, unitPrice: 2),
    );
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
            19, (index) => index.isEven ? CustomGiftCardTile(giftCard) : const Divider(height: 0)),
      ),
    );
  }
}
