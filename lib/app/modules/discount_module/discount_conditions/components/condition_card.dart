import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import 'index.dart';

class ConditionCard extends StatelessWidget {
  const ConditionCard({Key? key, required this.title, required this.subtitle, this.onTap}) : super(key: key);
  final String title, subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            color: Theme.of(context).appBarTheme.backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  Text(subtitle, style: mediumTextStyle?.copyWith(color: lightWhite)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: lightWhite, size: 20),
          ],
        ),
      ),
    );
  }
}

class DetailedConditionCard extends StatelessWidget {
  const DetailedConditionCard({
    Key? key,
    required this.discountCondition,
    this.onDeleteTap,
    this.onEditTap,
  }) : super(key: key);
  final DiscountCondition discountCondition;
  final void Function()? onDeleteTap;
  final void Function(DiscountConditionType? discountConditionType)? onEditTap;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    String title = '', subtitle = '';
    void Function()? defaultEdit;

    switch (discountCondition.type) {
      case DiscountConditionType.products:
        title = 'Product';
        subtitle = discountCondition.operator! == DiscountConditionOperator.notIn
            ? 'Discount is applicable to all products except specific products'
            : 'Discount is applicable to specific products';
        defaultEdit = () => Get.to(() => const ConditionProductView(), arguments: discountCondition.products?.map((e) => Product(id: e)).toList(),);
        break;
      case DiscountConditionType.productType:
        title = 'Product Type';
        subtitle = discountCondition.operator! == DiscountConditionOperator.notIn
            ? 'Discount is applicable to all product types expect specific product types'
            : 'Discount is applicable to specific product types';
        defaultEdit = () => Get.to(() => const ConditionTypeView());

        break;
      case DiscountConditionType.productCollections:
        title = 'Collection';
        subtitle = discountCondition.operator! == DiscountConditionOperator.notIn
            ? 'Discount is applicable to all collections expect specific collections'
            : 'Discount is applicable to specific collections';
        defaultEdit = () => Get.to(() => const ConditionCollectionView());
        break;
      case DiscountConditionType.productTags:
        title = 'Tag';
        subtitle = discountCondition.operator! == DiscountConditionOperator.notIn
            ? 'Discount is applicable to all product tags except specific product tags'
            : 'Discount is applicable to specific product tags';
        defaultEdit = () => Get.to(() => const ConditionTagView());
        break;
      case DiscountConditionType.customerGroups:
        title = 'Customer Group';
        subtitle = discountCondition.operator! == DiscountConditionOperator.notIn
            ? 'Discount is applicable to all customer groups except specific customer groups'
            : 'Discount is applicable to specific customer groups';
        defaultEdit = () => Get.to(() => const ConditionCustomerGroupView());
        break;
      case null:
        defaultEdit = () {};
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)), color: Theme.of(context).scaffoldBackgroundColor),
      child: Row(
        children: [
          Container(
            width: 4.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: discountCondition.operator! == DiscountConditionOperator.notIn ? Colors.red : null,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: mediumTextStyle),
                Text(subtitle, style: smallTextStyle?.copyWith(color: lightWhite)),
              ],
            ),
          ),
          AdaptiveIcon(
              onPressed: () async {
                await showModalActionSheet<int>(
                    title: 'Manage condition',
                    message: title,
                    context: context,
                    actions: <SheetAction<int>>[
                      const SheetAction(label: 'Edit', key: 0),
                      const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
                    ]).then((result) {
                  if (result == null) return;
                  switch (result) {
                    case 0:
                      if (onEditTap != null) {
                        onEditTap!(discountCondition.type);
                      } else {
                        defaultEdit!();
                      }
                      break;
                    case 1:
                      if (onDeleteTap != null) {
                        onDeleteTap!();
                      }
                      break;
                  }
                });
              },
              icon: Icon(Icons.more_horiz, color: lightWhite)),
        ],
      ),
    );
  }
}
