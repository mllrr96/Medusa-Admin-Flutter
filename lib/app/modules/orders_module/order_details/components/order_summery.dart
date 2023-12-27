import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'order_summery_card.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery(this.order, {super.key, this.onExpansionChanged});
  final Order order;

  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final refunded = order.refunds?.isNotEmpty ?? false;
    const halfSpace = SizedBox(height: 6.0);
    final mediumTextStyle = context.bodyMedium;
    final totalTextTheme = refunded ? mediumTextStyle : context.bodyLarge;
    final tr = context.tr;

    return HeaderCard(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Summery'),
      trailing: TextButton(
          onPressed: () => context.pushRoute(AddUpdateOrderEditRoute(order: order)),
          child: const Text('Edit Order')),
      childPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        children:  [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.items!.length,
              itemBuilder: (context, index) => OrderSummeryCard(order: order, index: index)),
          const Divider(indent: 20, endIndent: 20),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr.detailCardsSubtotal, style: mediumTextStyle),
                    Text(order.subTotal.formatAsPrice(order.currencyCode), style: mediumTextStyle),
                  ],
                ),
              ),
              halfSpace,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr.detailCardsShipping, style: mediumTextStyle),
                    Text(order.shippingTotal.formatAsPrice(order.currencyCode), style: mediumTextStyle),
                  ],
                ),
              ),
              halfSpace,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr.detailCardsTax, style: mediumTextStyle),
                    Text(order.taxTotal.formatAsPrice(order.currencyCode), style: mediumTextStyle),
                  ],
                ),
              ),
              if (refunded) halfSpace,
              if (!refunded) const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(refunded ? tr.detailCardsOriginalTotal : tr.detailCardsTotal, style: totalTextTheme),
                    Text(order.total.formatAsPrice(order.currencyCode), style: context.bodyLarge),
                  ],
                ),
              ),
              halfSpace,
            ],
          ),
          if (refunded)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(tr.templatesManuallyRefunded, style: mediumTextStyle),
                      Text('- ${order.refundedTotal.formatAsPrice(order.currencyCode)}', style: mediumTextStyle),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(tr.templatesNetTotal, style: mediumTextStyle),
                      Text(order.refundableAmount.formatAsPrice(order.currencyCode), style: context.bodyLarge),
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
