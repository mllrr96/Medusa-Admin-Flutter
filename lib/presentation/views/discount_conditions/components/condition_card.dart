import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class ConditionCard extends StatelessWidget {
  const ConditionCard(
      {super.key, required this.title, required this.subtitle, this.onTap});
  final String title, subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            color: context.theme.appBarTheme.backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  Text(subtitle,
                      style: mediumTextStyle?.copyWith(color: manatee)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: manatee, size: 20),
          ],
        ),
      ),
    );
  }
}

class DetailedConditionCard extends StatelessWidget {
  const DetailedConditionCard({
    super.key,
    required this.discountCondition,
    this.onDeleteTap,
    this.onEditTap,
  });
  final DiscountCondition discountCondition;
  final void Function()? onDeleteTap;
  final void Function(DiscountConditionType? discountConditionType)? onEditTap;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    String title = '', subtitle = '';
    void Function()? defaultEdit;

    switch (discountCondition.type) {
      case DiscountConditionType.products:
        title = 'Product';
        subtitle = discountCondition.operator! ==
                DiscountConditionOperator.notIn
            ? 'Discount is applicable to all products except specific products'
            : 'Discount is applicable to specific products';
        defaultEdit = () => context.pushRoute(ConditionProductRoute());
        break;
      case DiscountConditionType.productType:
        title = 'Product Type';
        subtitle = discountCondition.operator! ==
                DiscountConditionOperator.notIn
            ? 'Discount is applicable to all product types expect specific product types'
            : 'Discount is applicable to specific product types';
        defaultEdit = () => context.pushRoute(ConditionTypeRoute());
        break;
      case DiscountConditionType.productCollections:
        title = 'Collection';
        subtitle = discountCondition.operator! ==
                DiscountConditionOperator.notIn
            ? 'Discount is applicable to all collections expect specific collections'
            : 'Discount is applicable to specific collections';
        defaultEdit = () => context
            .pushRoute(ConditionCollectionRoute(disabledCollections: null));
        break;
      case DiscountConditionType.productTags:
        title = 'Tag';
        subtitle = discountCondition.operator! ==
                DiscountConditionOperator.notIn
            ? 'Discount is applicable to all product tags except specific product tags'
            : 'Discount is applicable to specific product tags';
        defaultEdit = () => context.pushRoute(ConditionTagRoute());
        break;
      case DiscountConditionType.customerGroups:
        title = 'Customer Group';
        subtitle = discountCondition.operator! ==
                DiscountConditionOperator.notIn
            ? 'Discount is applicable to all customer groups except specific customer groups'
            : 'Discount is applicable to specific customer groups';
        defaultEdit = () => context
            .pushRoute(ConditionCustomerGroupRoute(disabledGroups: null));
        break;
      case null:
        defaultEdit = () {};
        break;
    }
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: context.theme.scaffoldBackgroundColor),
      child: Row(
        children: [
          Container(
            width: 4.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: discountCondition.operator! ==
                        DiscountConditionOperator.notIn
                    ? Colors.red
                    : null,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4))),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: mediumTextStyle),
                Text(subtitle, style: smallTextStyle?.copyWith(color: manatee)),
              ],
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(16.0),
              onPressed: () async {
                await showModalActionSheet<int>(
                    title: 'Manage condition',
                    message: title,
                    context: context,
                    actions: <SheetAction<int>>[
                      const SheetAction(label: 'Edit', key: 0),
                      const SheetAction(
                          label: 'Delete', isDestructiveAction: true, key: 1),
                    ]).then((result) {
                  if (result == null) return;
                  switch (result) {
                    case 0:
                      if (onEditTap != null) {
                        onEditTap?.call(discountCondition.type);
                      } else {
                        defaultEdit?.call();
                      }
                      break;
                    case 1:
                      onDeleteTap?.call();
                      break;
                  }
                });
              },
              icon: const Icon(Icons.more_horiz, color: manatee)),
        ],
      ),
    );
  }
}
