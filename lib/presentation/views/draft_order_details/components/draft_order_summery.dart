import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'draft_order_summery_card.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
class DraftOrderSummery extends StatelessWidget {
  const DraftOrderSummery(this.draftOrder, {super.key});
  final DraftOrder draftOrder;

  @override
  Widget build(BuildContext context) {
    const halfSpace = SizedBox(height: 6.0);
    final mediumTextStyle = context.bodyMedium;
    final totalTextTheme = context.headlineMedium;
    final currencyCode = draftOrder.cart?.region?.currencyCode;

    return FlexExpansionTile(
      onExpansionChanged: (expanded) async {
        if (expanded && key is GlobalKey) {
          await (key as GlobalKey).currentContext.ensureVisibility();
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Summery'),
      childPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
     child: Column(
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
     ),
    );
  }
}
