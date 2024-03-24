import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'order_overview.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

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
                FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Summery'),
                ),
                space,
                FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Payment'),
                ),
                space,
                FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Fulfillment'),
                ),
                space,
                FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Customer'),
                ),
                space,
                FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Timeline'),
                ),
              ],
            ),
          ),
        ));
  }
}
