import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/medusa_icons_icons.dart';

class SearchChip extends StatelessWidget {
  const SearchChip(
      {super.key,
      required this.searchableField,
      this.onTap,
      this.selected = false});
  final SearchCategory searchableField;
  final void Function()? onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    var title = '';
    var iconDate = MedusaIcons.tag;
    Color chipColor = Colors.red;
    switch (searchableField) {
      case SearchCategory.orders:
        title = 'Orders';
        iconDate = CupertinoIcons.cart;
        chipColor = Colors.purple;
      case SearchCategory.draftOrders:
        title = 'Draft Orders';
        iconDate = MedusaIcons.tag;
        chipColor = Colors.teal;
      case SearchCategory.products:
        title = 'Products';
        iconDate = GetPlatform.isIOS ? MedusaIcons.tag : CupertinoIcons.tag;
        chipColor = Colors.amber;

      case SearchCategory.collections:
        title = 'Collections';
        iconDate = Icons.collections_bookmark;
        chipColor = Colors.blue;

      case SearchCategory.customers:
        title = 'Customers';
        iconDate = GetPlatform.isIOS ? MedusaIcons.users : Icons.person;
        chipColor = Colors.brown;

      case SearchCategory.groups:
        title = 'Groups';
        iconDate = Icons.groups;
        chipColor = Colors.deepOrange;

      case SearchCategory.giftCards:
        title = 'Gift Cards';
        iconDate = CupertinoIcons.gift;
        chipColor = Colors.pink;

      case SearchCategory.discounts:
        title = 'Discounts';
        iconDate = Icons.discount_outlined;
        chipColor = Colors.lime;

      case SearchCategory.priceLists:
        title = 'Price Lists';
        iconDate = MedusaIcons.currency_dollar;
        chipColor = Colors.redAccent;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(4.0),
      splashColor: Colors.white54,
      highlightColor: Colors.white54,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), color: chipColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconDate, color: Colors.white, size: 12),
            const SizedBox(width: 3.0),
            Text(
              title,
              style: smallTextStyle?.copyWith(color: Colors.white),
            ),
            if (onTap != null && !selected)
              const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            if (selected)
              const Icon(Icons.check, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
