import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'order_overview.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

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
      id: '',
      version: 0,
      status: OrderStatus.canceled,
    );
    const space = Gap(12);
    return Skeletonizer(
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OrderOverview(order: order),
                space,
                const FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Summery'),
                ),
                space,
                const FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Payment'),
                ),
                space,
                const FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Fulfillment'),
                ),
                space,
                const FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Customer'),
                ),
                space,
                const FlexExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Timeline'),
                ),
              ],
            ),
          ),
        ));
  }
}
