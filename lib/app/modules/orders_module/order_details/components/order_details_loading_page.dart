import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'order_overview.dart';

class OrderDetailsLoadingPage extends StatelessWidget {
  const OrderDetailsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final order = Order(
        displayId: 123,
        customerId: '',
        email: 'Medusa@js.com',
        regionId: '',
        currencyCode: 'USD',
    payments: [
      Payment(amount: 120, currencyCode: 'USD', providerId: 'System')
    ]
    );
    const space = Gap(12);
    return Skeletonizer(
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OrderOverview(order: order),
                space,
                const HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Summery'),
                ),
                space,
                const HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Payment'),
                ),
                space,
                const HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Fulfillment'),
                ),
                space,
                const HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Customer'),
                ),
                space,
                const HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Timeline'),
                ),
              ],
            ),
          ),
        ));
  }
}
