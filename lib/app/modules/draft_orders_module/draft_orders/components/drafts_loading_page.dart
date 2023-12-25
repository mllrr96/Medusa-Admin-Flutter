import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/draft_orders/components/draft_order_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DraftsLoadingPage extends StatelessWidget {
  const DraftsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final draftOrder = DraftOrder(
      id: '1',
      displayId: 1,
      order: Order(
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
    return Column(
        children: List.generate(
            20,
            (index) => index.isEven
                ? Skeletonizer(enabled: true, child: DraftOrderCard(draftOrder))
                : const Gap(12.0)));
  }
}
