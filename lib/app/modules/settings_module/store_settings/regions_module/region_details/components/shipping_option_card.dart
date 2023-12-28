import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../components/adaptive_icon.dart';
import 'shipping_option_label.dart';

class ShippingOptionCard extends StatelessWidget {
  const ShippingOptionCard(
      {super.key,
      required this.shippingOption,
      this.onEditTap,
      this.onDeleteTap});
  final ShippingOption shippingOption;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const halfSpace = SizedBox(height: 6.0);
    final currencyCode = shippingOption.region?.currencyCode;
    String getMaxText() {
      String text = '';
      for (var requirement in shippingOption.requirements!) {
        if (requirement.type! == RequirementType.maxSubtotal) {
          text =
              'Max. subtotal: ${requirement.amount.formatAsPrice(currencyCode, symbolAtEnd: true)}';
        }
      }
      if (text.isEmpty) {
        return 'Max. subtotal: N/A';
      }
      return text;
    }

    String getMinText() {
      String text = '';
      for (var requirement in shippingOption.requirements!) {
        if (requirement.type! == RequirementType.minSubtotal) {
          text =
              'Min. subtotal: ${requirement.amount.formatAsPrice(currencyCode, symbolAtEnd: true)}';
        }
      }
      if (text.isEmpty) {
        return 'Min. subtotal: N/A';
      }
      return text;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Theme.of(context).cardColor,
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(shippingOption.name ?? '',
                          style: mediumTextStyle?.copyWith(
                              fontWeight: FontWeight.w500))),
                  AdaptiveIcon(
                      onPressed: () async {
                        await showModalActionSheet<int>(
                            title: (shippingOption.isReturn ?? false)
                                ? 'Manage return shipping option'
                                : 'Manage shipping option',
                            message: shippingOption.name,
                            context: context,
                            actions: <SheetAction<int>>[
                              const SheetAction(label: 'Edit', key: 0),
                              const SheetAction(
                                  label: 'Delete',
                                  isDestructiveAction: true,
                                  key: 1),
                            ]).then((value) async {
                          switch (value) {
                            case 0:
                              if (onEditTap != null) {
                                onEditTap!();
                              }
                              break;
                            case 1:
                              if (onDeleteTap != null) {
                                onDeleteTap!();
                              }
                              break;
                          }
                        });
                      },
                      icon: const Icon(Icons.more_horiz))
                ],
              ),
              halfSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                        'Flat Rate: ${shippingOption.amount.formatAsPrice(currencyCode, symbolAtEnd: true)}',
                        style: smallTextStyle?.copyWith(color: lightWhite)),
                  ),
                  ShippingOptionLabel(
                      adminOnly: shippingOption.adminOnly ?? false)
                ],
              ),
              halfSpace,
              Text('${getMinText()} - ${getMaxText()}',
                  style: smallTextStyle?.copyWith(color: lightWhite)),
              halfSpace,
            ],
          ),
        ],
      ),
    );
  }
}
