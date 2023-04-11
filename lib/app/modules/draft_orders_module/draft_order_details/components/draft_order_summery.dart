import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

import '../../../../data/service/store_service.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/custom_expansion_tile.dart';
import 'draft_order_summery_card.dart';

class DraftOrderSummery extends StatelessWidget {
  const DraftOrderSummery(this.draftOrder, {Key? key, this.onExpansionChanged}) : super(key: key);
  final DraftOrder draftOrder;

  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    const halfSpace = SizedBox(height: 6.0);
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final totalTextTheme =  Theme.of(context).textTheme.displayLarge;
    final currencyCode = draftOrder.cart!.region!.currencyCode;

    String getPrice(num? price) {
      var value = price ?? 0;
      final currencyFormatter = CurrencyTextInputFormatter(name: currencyCode);
      final symbolNative =
          StoreService.store.currencies?.where((element) => element.code == currencyCode).first.symbolNative;
      return '${symbolNative ?? ''} ${currencyFormatter.format(value.toString())}';
    }

    return CustomExpansionTile(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Summery'),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:draftOrder.cart!.items!.length ,
            itemBuilder: (context, index) => DraftOrderSummeryCard(item: draftOrder.cart!.items![index], currencyCode: currencyCode!)),
        const Divider(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: mediumTextStyle),
                  Row(
                    children: [
                      Text(getPrice(draftOrder.cart!.subTotal), style: mediumTextStyle),
                      // Text(' ${draftOrder.currencyCode?.toUpperCase() ?? ''}',
                      //     style: mediumTextStyle?.copyWith(color: lightWhite)),
                    ],
                  ),
                ],
              ),
            ),
            halfSpace,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping', style: mediumTextStyle),
                  Row(
                    children: [
                      Text(getPrice(draftOrder.cart!.shippingTotal), style: mediumTextStyle),
                      Text(' ${currencyCode?.toUpperCase() ?? ''}',
                          style: mediumTextStyle?.copyWith(color: lightWhite)),
                    ],
                  ),
                ],
              ),
            ),
            halfSpace,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tax', style: mediumTextStyle),
                  Row(
                    children: [
                      Text(getPrice(draftOrder.cart!.taxTotal), style: mediumTextStyle),
                      Text(' ${currencyCode?.toUpperCase() ?? ''}',
                          style: mediumTextStyle?.copyWith(color: lightWhite)),
                    ],
                  ),
                ],
              ),
            ),
            halfSpace,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: totalTextTheme),
                  Text(getPrice(draftOrder.cart!.total), style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
            ),
            halfSpace,
          ],
        ),
      ],
    );
  }


}
