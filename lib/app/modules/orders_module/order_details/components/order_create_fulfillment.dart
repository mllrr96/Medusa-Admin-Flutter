import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class OrderCreateFulfillment extends StatefulWidget {
  const OrderCreateFulfillment({required this.order, Key? key}) : super(key: key);
  final Order order;
  @override
  State<OrderCreateFulfillment> createState() => _OrderCreateFulfillmentState();
}

class _OrderCreateFulfillmentState extends State<OrderCreateFulfillment> {
  Map<String, int> lineItemCount = {};
  List<LineItem> items = [];
  @override
  void initState() {
    widget.order.items?.forEach((e) {
      if ((e.quantity! - (e.fulfilledQuantity ?? 0)) != 0) {
        lineItemCount.addAll({e.id!: e.quantity!});
        items.add(e);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);

    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Create Fulfillment'),
        actions: [
          AdaptiveButton(
              onPressed: lineItemCount.values.toList().sum != 0
                  ? () {
                      List<LineItem> lineItems = [];
                      lineItemCount.forEach((key, value) {
                        if (value != 0) {
                          lineItems.add(LineItem(id: key, quantity: value));
                        }
                      });
                      Get.back(result: lineItems);
                    }
                  : null,
              child: const Text('Create'))
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            space,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('Items to fulfill', style: mediumTextStyle),
            ),
            halfSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('Select the number of items that you wish to fulfill.',
                  style: mediumTextStyle?.copyWith(color: lightWhite)),
            ),
            halfSpace,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          item.thumbnail != null
                              ? SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CachedNetworkImage(key: ValueKey(item.thumbnail), imageUrl: item.thumbnail!),
                                )
                              : const SizedBox(height: 50, width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title ?? '', style: mediumTextStyle),
                              Text(item.variant?.title ?? '', style: smallTextStyle),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                        child: Row(
                          children: [
                            Text('${lineItemCount[item.id]!.toString()} / ${item.quantity!}'),
                            AdaptiveIcon(
                              onPressed: () {
                                if (lineItemCount[item.id!] == 0) {
                                  return;
                                }
                                setState(() {
                                  lineItemCount[item.id!] = lineItemCount[item.id]! - 1;
                                });
                              },
                              icon: const Icon(CupertinoIcons.minus),
                            ),
                            AdaptiveIcon(
                              onPressed: () {
                                if (lineItemCount[item.id!] == item.quantity!) {
                                  return;
                                }
                                setState(() {
                                  lineItemCount[item.id!] = lineItemCount[item.id]! + 1;
                                });
                              },
                              icon: const Icon(CupertinoIcons.add),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
