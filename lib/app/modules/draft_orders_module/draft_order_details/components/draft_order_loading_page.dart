import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/draft_order_details/components/draft_order_overview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DraftOrderLoadingPage extends StatelessWidget {
  const DraftOrderLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final draftOrder = DraftOrder(
      displayId: 123,
      cart: Cart(
          email: 'Medusa@js.com',
          total: 1234,
          region: Region(name: '', currencyCode: 'USD', taxRate: 10),
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
              const HeaderCard(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Summery'),
              ),
              space,
              const HeaderCard(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Payment'),
              ),
              space,
              const HeaderCard(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Shipping'),
              ),
              space,
              const HeaderCard(
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
