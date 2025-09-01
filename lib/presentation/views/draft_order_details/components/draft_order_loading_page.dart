import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

import 'draft_order_overview.dart';

class DraftOrderLoadingPage extends StatelessWidget {
  const DraftOrderLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final draftOrder = DraftOrder(
      displayId: 123,
      cart: Cart(
          email: 'Medusa@js.com',
          total: 1234,
          region: const Region(name: '', currencyCode: 'USD', taxRate: 10),
          createdAt: DateTime.now()),
      status: DraftOrderStatus.open,
    );
    const space = Gap(12);

    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Column(
            children: [
              DraftOrderOverview(draftOrder),
              space,
              const FlexExpansionTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Summery'),
              ),
              space,
              const FlexExpansionTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Payment'),
              ),
              space,
              const FlexExpansionTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Shipping'),
              ),
              space,
              const FlexExpansionTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Customer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
