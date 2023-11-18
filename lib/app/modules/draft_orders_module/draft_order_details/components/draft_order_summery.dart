import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../components/custom_expansion_tile.dart';
import 'draft_order_summery_card.dart';

class DraftOrderSummery extends StatelessWidget {
  const DraftOrderSummery(this.draftOrder, {Key? key, this.onExpansionChanged}) : super(key: key);
  final DraftOrder draftOrder;

  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    const halfSpace = SizedBox(height: 6.0);
    final mediumTextStyle = context.bodyMedium;
    final totalTextTheme = context.headlineMedium;
    final currencyCode = draftOrder.cart?.region?.currencyCode;

    return CustomExpansionTile(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Summery'),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: draftOrder.cart!.items!.length,
            itemBuilder: (context, index) =>
                DraftOrderSummeryCard(item: draftOrder.cart!.items![index], currencyCode: currencyCode!)),
        const Divider(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: mediumTextStyle),
                  Text(draftOrder.cart?.subTotal.formatAsPrice(currencyCode) ?? '', style: mediumTextStyle),
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
                  Text(draftOrder.cart?.shippingTotal.formatAsPrice(currencyCode) ?? '', style: mediumTextStyle),
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
                  Text(draftOrder.cart?.taxTotal.formatAsPrice(currencyCode) ?? '', style: mediumTextStyle),
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
                  Text(draftOrder.cart?.total.formatAsPrice(currencyCode) ?? '', style: context.headlineMedium),
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
