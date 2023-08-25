import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_popup/info_popup.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_details/controllers/discount_details_controller.dart';
import 'package:super_banners/super_banners.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/discount_rule.dart';
import '../../discounts/components/discount_rule_type_label.dart';

class DiscountDetailsCard extends GetView<DiscountDetailsController> {
  const DiscountDetailsCard(this.discount, {Key? key}) : super(key: key);
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    final disabled = discount.isDisabled ?? true;
    final expired = discount.endsAt != null && discount.endsAt!.isBefore(DateTime.now());
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);
    Widget discountValueText(Discount discount) {
      String valueText = '';
      Color valueColor = Colors.green;
      String detail = '';
      var value = discount.rule!.value!.roundToDouble();
      final valueFormatter = NumberFormat.currency(name: discount.regions!.first.currencyCode!);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      switch (discount.rule!.type!) {
        case DiscountRuleType.fixed:
          valueText = valueFormatter.format(value).split(valueFormatter.currencySymbol)[1];
          valueColor = Colors.orangeAccent;
          detail = ' ${discount.regions?.first.currency?.code ?? ''}';
          break;
        case DiscountRuleType.percentage:
          valueText = discount.rule!.value!.toString();
          valueColor = Colors.blueAccent;

          detail = ' %';
          break;
        case DiscountRuleType.freeShipping:
          valueColor = Colors.green;
          valueText = 'Free shipping';
          break;
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (discount.rule?.type == DiscountRuleType.fixed)
            Flexible(
                child: Text('${discount.regions?.first.currency?.symbolNative ?? ''} ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: valueColor))),
          Text(valueText, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: valueColor)),
          if (detail.isNotEmpty) Text(detail.toUpperCase(), style: smallTextStyle?.copyWith(color: lightWhite)),
        ],
      );
    }

    String regionsName(Discount discount) {
      String regions = '';
      discount.regions?.forEach((element) {
        if (regions.isNotEmpty) {
          regions = '$regions, ${element.name ?? ''}';
        } else {
          regions = element.name ?? '';
        }
      });

      return regions;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: Theme.of(context).expansionTileTheme.backgroundColor,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        discount.code ?? '',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: expired ? 12.0: 0.0),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                          onPressed: () async {
                            await showOkCancelAlertDialog(
                                    context: context,
                                    title: disabled ? 'Enable' : 'Disable',
                                    message: 'Are you sure you want to ${disabled ? 'enable' : 'disable'} discount?',
                                    okLabel: 'Yes, ${disabled ? 'enable' : 'disable'}',
                                    isDestructiveAction: true)
                                .then((value) async {
                              if (value == OkCancelResult.ok) {
                                await controller.toggleDiscount(discount: discount);
                              }
                            });
                          },
                          child: DiscountStatusDot(disabled: disabled)),
                    ),
                  ],
                ),
                if (discount.rule?.description?.isNotEmpty ?? false)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space,
                      Text(discount.rule?.description ?? '', style: smallTextStyle?.copyWith(color: lightWhite)),
                    ],
                  ),
                space,
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            discountValueText(discount),
                            Text('Discount Amount', style: smallTextStyle?.copyWith(color: lightWhite))
                          ],
                        ),
                      ),
                      const VerticalDivider(width: 0),
                      Flexible(
                        child: InfoPopupWidget(
                          arrowTheme: InfoPopupArrowTheme(
                            arrowDirection: ArrowDirection.up,
                            color: ColorManager.primary,
                          ),
                          contentTheme: InfoPopupContentTheme(
                            infoContainerBackgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
                            infoTextStyle: smallTextStyle!,
                            contentPadding: const EdgeInsets.all(8),
                            contentBorderRadius: const BorderRadius.all(Radius.circular(4)),
                            infoTextAlign: TextAlign.start,
                          ),
                          contentTitle: regionsName(discount),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(discount.regions?.length.toString() ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text('Valid Regions', style: smallTextStyle.copyWith(color: lightWhite))
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(width: 0),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(discount.usageCount.toString(), style: Theme.of(context).textTheme.bodyLarge),
                            Text('Total Redemptions', style: smallTextStyle.copyWith(color: lightWhite))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (expired)
            CornerBanner(
              bannerColor: Colors.red,
              bannerPosition: CornerBannerPosition.topRight,
              child: Text(
                'Expired',
                style: smallTextStyle.copyWith(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
