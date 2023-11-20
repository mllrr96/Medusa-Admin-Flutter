import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class EditOrderItems extends StatefulWidget {
  const EditOrderItems({super.key, required this.order});
  final Order order;

  @override
  State<EditOrderItems> createState() => _EditOrderItemsState();
}

class _EditOrderItemsState extends State<EditOrderItems> {
  Map<String, int> addedItems = {};
  late List<LineItem> lineItems;
  List<LineItem> get deletedItems =>
      widget.order.items?.where((element) {
        final originalIds = widget.order.items?.map((e) => e.id).toList();
        final ids = lineItems.map((e) => e.id).toList();
        final differenceIds = originalIds?.toSet().difference(ids.toSet()).toList();
        return differenceIds?.contains(element.id) ?? false;
      }).toList() ??
      [];

  @override
  void initState() {
    lineItems = List<LineItem>.from(widget.order.items!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final tr = context.tr;
    final currencyCode = order.currencyCode;

    num differenceDue() {
      num sum = 0;
      addedItems.forEach((key, value) {
        final price = lineItems.where((element) => element.id == key).firstOrNull?.unitPrice;
        sum = sum + ((price ?? 0) * value);
      });
      for (LineItem item in deletedItems) {
        sum = sum - ((item.unitPrice ?? 0) * (item.quantity ?? 0));
      }
      return sum;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.editEditOrder),
      ),
      bottomNavigationBar:
          Container(color: context.theme.appBarTheme.backgroundColor, height: context.bottomViewPadding),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: context.theme.appBarTheme.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SearchTextField(
              controller: TextEditingController(),
              fillColor: context.theme.scaffoldBackgroundColor,
              hintText: 'Add a note',
              prefixIconData: Icons.tag_faces,
              onSuffixTap: () {},
              maxLines: null,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              textInputAction: TextInputAction.send,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (_) {},
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr.editItems, style: context.bodyLarge),
              AdaptiveButton(onPressed: () {}, child: Text(tr.editAddItems)),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lineItems.length,
            separatorBuilder: (_, __) => const Gap(10),
            itemBuilder: (context, index) {
              final item = lineItems[index];
              final itemQuantity = (item.quantity ?? 1) + (addedItems.containsKey(item.id) ? addedItems[item.id]! : 0);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        if (item.thumbnail?.isNotEmpty ?? false)
                          SizedBox(width: 50, child: CachedNetworkImage(imageUrl: item.thumbnail!)),
                        const Gap(10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title ?? '', style: context.bodyLarge),
                              Text(item.variant?.title ?? '', style: context.bodyMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(((item.unitPrice ?? 1) * itemQuantity).formatAsPrice(order.currencyCode)),
                          const Gap(5),
                          Text(
                            order.currencyCode?.toUpperCase() ?? '',
                            style: context.bodyMedium?.copyWith(color: ColorManager.manatee),
                          ),
                          AdaptiveIcon(
                              onPressed: () async {
                                final result = await showModalActionSheet(context: context, actions: <SheetAction>[
                                  SheetAction(label: tr.orderLineReplaceWithOtherItem, key: 0),
                                  SheetAction(label: tr.orderLineDuplicateItem, key: 1),
                                  SheetAction(label: tr.orderLineRemoveItem, key: 2, isDestructiveAction: true),
                                ]);
                                switch (result) {
                                  case 0:
                                    break;

                                  case 1:
                                    break;

                                  case 2:
                                    lineItems.removeAt(index);
                                    setState(() {});
                                    break;
                                }
                              },
                              icon: const Icon(Icons.more_horiz))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                        child: Row(
                          children: [
                            AdaptiveIcon(
                              onPressed: () {
                                final canRemove = (item.quantity ?? -1) > 0;
                                if (!addedItems.keys.contains(item.id)) {
                                  addedItems.addAll({item.id!: -1});
                                } else if (addedItems.keys.contains(item.id) && canRemove) {
                                  addedItems.update(item.id ?? '', (value) {
                                    if ((item.quantity ?? 0) + (addedItems[item.id] ?? 0) == 1) {
                                      return value;
                                    }
                                    return value - 1;
                                  });
                                }
                                setState(() {});
                              },
                              icon: const Icon(CupertinoIcons.minus),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(((item.quantity ?? 0) + (addedItems[item.id] ?? 0)).toString()),
                            ),
                            AdaptiveIcon(
                              onPressed: () {
                                if (!addedItems.keys.contains(item.id)) {
                                  addedItems.addAll({item.id!: 1});
                                } else {
                                  addedItems.update(item.id ?? '', (value) => value + 1);
                                }
                                setState(() {});
                              },
                              icon: const Icon(CupertinoIcons.add),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          ),
          if (differenceDue() != 0)
            Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr.editAmountPaid, style: context.bodyLarge),
                    Row(
                      children: [
                        Text(order.paidTotal?.formatAsPrice(currencyCode) ?? '', style: context.bodyLarge),
                        Text(' ${currencyCode?.toUpperCase() ?? ''}',
                            style: context.bodyLarge?.copyWith(color: ColorManager.manatee))
                      ],
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr.editNewTotal, style: context.headlineMedium),
                    Text(((order.paidTotal ?? 0) + differenceDue()).formatAsPrice(currencyCode),
                        style: context.headlineMedium),
                  ],
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr.editDifferenceDue, style: context.bodyLarge),
                    Row(
                      children: [
                        Text(
                          differenceDue().formatAsPrice(currencyCode),
                          style: context.bodyLarge
                              ?.copyWith(color: differenceDue().isNegative ? null : Colors.greenAccent),
                        ),
                        Text(' ${currencyCode?.toUpperCase() ?? ''}',
                            style: context.bodyLarge?.copyWith(color: ColorManager.manatee))
                      ],
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
