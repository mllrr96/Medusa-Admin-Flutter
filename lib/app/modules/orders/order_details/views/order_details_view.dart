import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    final order = controller.order;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
        actions: [
          if (GetPlatform.isIOS) CupertinoButton(child: const Text('Edit Order'), onPressed: () {}),
          if (GetPlatform.isAndroid) TextButton(child: const Text('Edit Order'), onPressed: () {})
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                color: Theme.of(context).expansionTileTheme.backgroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('#${order.displayId!}', style: Theme.of(context).textTheme.titleLarge),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.copy, size: 14))
                            ],
                          ),
                          if (order.cart != null && order.cart!.completedAt != null)
                            Text(
                                'on ${DateFormat.MEd().format(order.cart!.completedAt!)} at ${DateFormat.jm().format(order.cart!.completedAt!)}')
                        ],
                      ),
                      Text(order.status.name, style: Theme.of(context).textTheme.titleLarge)
                    ],
                  ),
                  const Divider(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.email!, style: Theme.of(context).textTheme.titleMedium),
                          Text('07812357633', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Payment', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey)),
                          Text('Manual', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            space,
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Summery'),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
              children: [],
            ),
            space,
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Payment'),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ),
            space,
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Fulfillment'),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ),
            space,
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Customer'),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ),
            space,
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Timeline'),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ),
          ],
        ),
      )),
    );
  }
}
