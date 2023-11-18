import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import 'order_summery_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;

  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final refunded = order.refunds?.isNotEmpty ?? false;
    const halfSpace = SizedBox(height: 6.0);
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final totalTextTheme = refunded ? mediumTextStyle : context.bodyLarge;
    final tr = AppLocalizations.of(context)!;

    return CustomExpansionTile(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(tr.summery),
      trailing: AdaptiveButton(onPressed: () {}, padding: EdgeInsets.zero, child: const Text('Edit Order')),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.items!.length,
            itemBuilder: (context, index) => OrderSummeryCard(order: order, index: index)),
        const Divider(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr.subtotal, style: mediumTextStyle),
                  Row(
                    children: [
                      Text(order.subTotal.formatAsPrice(order.currencyCode), style: mediumTextStyle),
                      Text(' ${order.currencyCode?.toUpperCase() ?? ''}',
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
                  Text(tr.shipping, style: mediumTextStyle),
                  Row(
                    children: [
                      Text(order.shippingTotal.formatAsPrice(order.currencyCode), style: mediumTextStyle),
                      Text(' ${order.currencyCode?.toUpperCase() ?? ''}',
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
                  Text(tr.tax, style: mediumTextStyle),
                  Row(
                    children: [
                      Text(order.taxTotal.formatAsPrice(order.currencyCode), style: mediumTextStyle),
                      Text(' ${order.currencyCode?.toUpperCase() ?? ''}',
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
                  Text(refunded ? tr.originalTotal : tr.total, style: totalTextTheme),
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
                    Text(tr.manuallyRefunded, style: mediumTextStyle),
                    Row(
                      children: [
                        Text(order.refundedTotal.formatAsPrice( order.currencyCode), style: mediumTextStyle),
                        Text(' ${order.currencyCode?.toUpperCase() ?? ''}',
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
                    Text(tr.netTotal, style: mediumTextStyle),
                    Text(order.refundableAmount.formatAsPrice(order.currencyCode), style: context.bodyLarge),
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
