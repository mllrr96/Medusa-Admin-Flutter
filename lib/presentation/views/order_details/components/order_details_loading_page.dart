import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
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
        ]);
    List<String> items = [
      'Summery',
      'Payment',
      'Fulfillment',
      'Customers',
      'Timeline'
    ];
    const space = Gap(12);
    return Skeletonizer(
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const OrderOverview(order: order),
                space,
                ShadAccordion<String>.multiple(
                  children: items
                      .map((e) => ShadAccordionItem(
                            value: e,
                            title: Text(e),
                            child: const SizedBox.shrink(),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ));
  }
}
