import 'package:flutter/material.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/price_list.dart';

class PriceListTypeCard extends StatelessWidget {
  const PriceListTypeCard(
      {Key? key, required this.priceListType, this.onTap, required this.groupValue})
      : super(key: key);
  final PriceListType priceListType;
  final PriceListType groupValue;
  final void Function(PriceListType priceListType)? onTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    String title = '';
    String description = '';
    switch (priceListType) {
      case PriceListType.sale:
        title = 'Sale';
        description = 'Use this if you are creating prices for a sale.';
        break;
      case PriceListType.override:
        title = 'Override';
        description = 'Use this to override prices.';
        break;
    }

    final borderColor = groupValue == priceListType ? ColorManager.primary : Colors.transparent;
    final selected = priceListType == groupValue;
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(priceListType);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius:
                selected ? const BorderRadius.all(Radius.circular(10)) : const BorderRadius.all(Radius.circular(4)),
            color:  Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: borderColor,
            )),
        child: Row(
          children: [
            Radio<PriceListType>(
                value: priceListType,
                groupValue: groupValue,
                onChanged: (val) {
                  if (val != null) {
                    if (onTap != null ) {
                      onTap!(priceListType);
                    }
                  }
                }),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: mediumTextStyle),
                  Text(
                    description,
                    style: smallTextStyle?.copyWith(color: lightWhite),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
