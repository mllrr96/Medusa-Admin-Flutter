import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'product_gift_card_list_tile.dart';

class GiftCardsLoadingPage extends StatelessWidget {
  const GiftCardsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const product = Product(
        title: 'Medusa LongSleeve',
        description:
            'Reimagine the feeling of a classic long-sleeve. With our cotton long-sleeve, everyday essentials no longer have to be ordinary. Made with 100% cotton.',
        subtitle: 'subtitle',
        handle: 'medusa-longsleeve',
        id: 'id',
        isGiftcard: false,
        status: ProductStatus.draft,
        discountable: false);
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
