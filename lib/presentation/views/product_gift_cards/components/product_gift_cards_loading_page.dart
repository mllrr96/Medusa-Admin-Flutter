import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'product_gift_card_list_tile.dart';

class GiftCardsLoadingPage extends StatelessWidget {
  const GiftCardsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const product = Product(
      id: '1',
      title: 'Gift Card',
      description: 'Gift Card Description',
      status: ProductStatus.published,
      isGiftCard: true,
    );
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
            20,
            (index) => index.isEven
                ? const GiftCardListTile(giftCard: product)
                : const Divider(height: 0)),
      ),
    );
  }
}
