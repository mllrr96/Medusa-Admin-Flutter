import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'draft_order_card.dart';

class DraftsLoadingPage extends StatelessWidget {
  const DraftsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final draftOrder = DraftOrder(
      id: '1',
      displayId: 1,
      order: const Order(
          customerId: '',
          email: '',
          regionId: '',
          currencyCode: 'USD',
          displayId: 1,
          customer: Customer(
              email: 'Medusa@js.com', firstName: 'Medusa', lastName: 'Js')),
      status: DraftOrderStatus.open,
      cart: Cart(createdAt: DateTime.now(), email: 'Medusa@js.com'),
    );
    return Skeletonizer(
      enabled: true,
      child: Column(
          children: List.generate(
              20,
              (index) => index.isEven
                  ? DraftOrderCard(draftOrder, shimmer: true)
                  : const Gap(12.0))),
    );
  }
}
