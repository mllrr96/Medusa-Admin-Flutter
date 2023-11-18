import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';

class DraftOrderShipping extends StatelessWidget {
  const DraftOrderShipping(this.draftOrder, {Key? key, this.onExpansionChanged}) : super(key: key);
  final DraftOrder draftOrder;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return CustomExpansionTile(
      title: const Text('Shipping'),
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shipping method', style: smallTextStyle?.copyWith(color: lightWhite)),
        halfSpace,
        if (draftOrder.cart?.shippingMethods != null)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: draftOrder.cart!.shippingMethods!.length,
            itemBuilder: (context, index) =>
                Text(draftOrder.cart!.shippingMethods![index].shippingOption?.name ?? '', style: mediumTextStyle),
          ),
        space,
      ],
    );
  }
}
