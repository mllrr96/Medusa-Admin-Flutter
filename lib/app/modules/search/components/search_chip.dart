import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/medusa_icons_icons.dart';
import '../controllers/medusa_search_controller.dart';

class SearchChip extends StatelessWidget {
  const SearchChip({super.key, required this.searchableField, this.onTap});
  final SearchableFields searchableField;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    var title = '';
    var iconDate = MedusaIcons.tag;
    Color chipColor = Colors.red;
    switch (searchableField) {
      case SearchableFields.orders:
        title = 'Orders';
        iconDate = CupertinoIcons.cart;
        chipColor = Colors.purple;
      case SearchableFields.draftOrders:
        title = 'Draft Orders';
        iconDate = MedusaIcons.tag;
        chipColor = Colors.teal;
      case SearchableFields.products:
        title = 'Products';
        iconDate = GetPlatform.isIOS ? MedusaIcons.tag : CupertinoIcons.tag;
        chipColor = Colors.amber;

      case SearchableFields.collections:
        title = 'Collections';
        iconDate = MedusaIcons.tag;
        chipColor = Colors.blue;

      case SearchableFields.customers:
        title = 'Customers';
        iconDate = GetPlatform.isIOS ? MedusaIcons.users : Icons.person;
        chipColor = Colors.brown;

      case SearchableFields.groups:
        title = 'Groups';
        iconDate = MedusaIcons.tag;
        chipColor = Colors.deepOrange;

      case SearchableFields.giftCards:
        title = 'Gift Cards';
        iconDate = CupertinoIcons.gift;
        chipColor = Colors.pink;

      case SearchableFields.discounts:
        title = 'Discounts';
        iconDate = Icons.discount_outlined;
        chipColor = Colors.lime;

      case SearchableFields.priceLists:
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
            if (onTap != null)
              const Icon(Icons.keyboard_arrow_down, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
