import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

import '../../../../../components/adaptive_icon.dart';
import 'shipping_option_label.dart';

class ShippingOptionCard extends StatelessWidget {
  const ShippingOptionCard({Key? key, required this.shippingOption, this.onEditTap, this.onDeleteTap})
      : super(key: key);
  final ShippingOption shippingOption;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const halfSpace = SizedBox(height: 6.0);
    final currencyCode = shippingOption.region?.currencyCode;
    final valueFormatter = NumberFormat.currency(name: currencyCode);
    var amount = shippingOption.amount!.roundToDouble();
    if (valueFormatter.decimalDigits != null) {
      amount = amount / pow(10, valueFormatter.decimalDigits!).roundToDouble();
    }
    String getMaxText() {
      final valueFormatter = NumberFormat.currency(name: currencyCode);
      String text = '';
      for (var requirement in shippingOption.requirements!) {
        if (requirement.type! == RequirementType.maxSubtotal) {
          var amount = requirement.amount!.roundToDouble();
          if (valueFormatter.decimalDigits != null) {
            amount = amount / pow(10, valueFormatter.decimalDigits!).roundToDouble();
          }
          text =
              'Max. subtotal: ${valueFormatter.format(amount).split(currencyCode!)[1]} ${currencyCode.toUpperCase()}';
        }
      }
      if (text.isEmpty) {
        return 'Max. subtotal: N/A';
      }
      return text;
    }

    String getMinText() {
      final valueFormatter = NumberFormat.currency(name: currencyCode);
      String text = '';
      for (var requirement in shippingOption.requirements!) {
        if (requirement.type! == RequirementType.minSubtotal) {
          var amount = requirement.amount!.roundToDouble();
          if (valueFormatter.decimalDigits != null) {
            amount = amount / pow(10, valueFormatter.decimalDigits!).roundToDouble();
          }
          text =
              'Min. subtotal: ${valueFormatter.format(amount).split(currencyCode!)[1]} ${currencyCode.toUpperCase()}';
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
                          style: mediumTextStyle?.copyWith(fontWeight: FontWeight.w500))),
                  AdaptiveIcon(
                      onPressed: () async {
                        await showModalActionSheet<int>(
                            title: shippingOption.isReturn ? 'Manage return shipping option' : 'Manage shipping option',
                            message: shippingOption.name,
                            context: context,
                            actions: <SheetAction<int>>[
                              const SheetAction(label: 'Edit', key: 0),
                              const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
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
                        'Flat Rate: ${valueFormatter.format(amount).split(currencyCode!)[1]} ${currencyCode.toUpperCase()}',
                        style: smallTextStyle?.copyWith(color: lightWhite)),
                  ),
                  ShippingOptionLabel(adminOnly: shippingOption.adminOnly)
                ],
              ),
              halfSpace,
              Text('${getMinText()} - ${getMaxText()}', style: smallTextStyle?.copyWith(color: lightWhite)),
              halfSpace,
            ],
          ),
        ],
      ),
    );
  }
}
