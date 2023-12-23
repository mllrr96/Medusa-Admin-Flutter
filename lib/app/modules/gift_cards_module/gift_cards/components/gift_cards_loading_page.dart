import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/gift_cards_module/gift_cards/components/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    return Column(
      children: List.generate(
          20,
          (index) => index.isEven
              ? const Skeletonizer(
                  enabled: true, child: GiftCardListTile(giftCard: product))
              : const Divider(height: 0)),
    );
  }
}
