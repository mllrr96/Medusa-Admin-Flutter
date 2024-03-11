import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../../core/constant/colors.dart';

class PriceListTypeCard extends StatelessWidget {
  const PriceListTypeCard(
      {super.key, required this.priceListType, this.onTap, required this.groupValue});
  final PriceListType priceListType;
  final PriceListType groupValue;
  final void Function(PriceListType priceListType)? onTap;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final bool useMaterial3 = context.theme.useMaterial3;
    final Color background = context.theme.scaffoldBackgroundColor;
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
    final selected = priceListType == groupValue;
    double borderRadius = useMaterial3 ? 12 : 4;
    final ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      side: selected
          ? BorderSide(color: context.theme.colorScheme.primaryContainer, width: 1)
          : BorderSide.none,
    );

    return Card(
      shape: shapeBorder,
      elevation: 0,
      color: background,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(priceListType);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
                      style: smallTextStyle?.copyWith(color: manatee),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
