import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../../core/constant/colors.dart';

@RoutePage()
class OrderCreateFulfillmentView extends StatefulWidget {
  const OrderCreateFulfillmentView({required this.order, super.key});
  final Order order;
  @override
  State<OrderCreateFulfillmentView> createState() => _OrderCreateFulfillmentViewState();
}

class _OrderCreateFulfillmentViewState extends State<OrderCreateFulfillmentView> {
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
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    const space = Gap(12);
    const halfSpace = Gap(6);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Fulfillment'),
        actions: [
          TextButton(
              onPressed: lineItemCount.values.toList().sum != 0
                  ? () {
                      List<LineItem> lineItems = [];
                      lineItemCount.forEach((key, value) {
                        if (value != 0) {
                          lineItems.add(LineItem(id: key, quantity: value));
                        }
                      });
                      context.popRoute(lineItems);
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
                  style: mediumTextStyle?.copyWith(color: manatee)),
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
                      Flexible(
                        child: Row(
                          children: [
                            item.thumbnail != null
                                ? SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CachedNetworkImage(key: ValueKey(item.thumbnail), imageUrl: item.thumbnail!),
                                  )
                                : const SizedBox(height: 50, width: 50),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.title ?? '', style: mediumTextStyle),
                                  Text(item.variant?.title ?? '', style: smallTextStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                        child: Row(
                          children: [
                            Text('${lineItemCount[item.id]!.toString()} / ${item.quantity!}'),
                            IconButton(
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
                            IconButton(
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
