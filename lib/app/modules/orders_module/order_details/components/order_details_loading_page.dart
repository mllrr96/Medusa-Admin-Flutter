import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'order_overview.dart';

class OrderDetailsLoadingPage extends StatelessWidget {
  const OrderDetailsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const order = Order(
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
    return const Skeletonizer(
        enabled: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 8.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OrderOverview(order: order),
                space,
                HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Summery'),
                ),
                space,
                HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Payment'),
                ),
                space,
                HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Fulfillment'),
                ),
                space,
                HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Customer'),
                ),
                space,
                HeaderCard(
                  leading: Icon(Icons.info_outline),
                  title: Text('Timeline'),
                ),
              ],
            ),
          ),
        ));
  }
}
