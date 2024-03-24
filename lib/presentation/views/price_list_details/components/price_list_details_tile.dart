import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin/presentation/views/discounts/components/discount_rule_type_label.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';


class PriceListDetailsTile extends StatelessWidget {
  const PriceListDetailsTile(this.priceList, {super.key, this.shimmer = false});
  final PriceList priceList;
  final bool shimmer;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);

    String getGroupsNames(PriceList priceList) {
      String names = '';
      final nameList = priceList.customerGroups!.map((e) => e.name!).toList();
      for (var element in nameList) {
        if (names.isEmpty) {
          names = element;
        } else {
          names = '$names, $element';
        }
      }
      return names;
    }


    return Skeletonizer(
      enabled: shimmer,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 12.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(
            horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(12.0)),
          color: context.theme.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  priceList.name ?? '',
                  style: context.headlineMedium,
                ),
                DiscountStatusDot(
                    disabled: priceList.status !=
                        PriceListStatus.active),
              ],
            ),
            space,
            Text(priceList.description ?? '',
                style:
                smallTextStyle?.copyWith(color: manatee)),
            if (priceList.customerGroups?.isNotEmpty ?? false)
              space,
            if (priceList.customerGroups?.isNotEmpty ?? false)
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(4.0)),
                    color:
                    context.theme.scaffoldBackgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Customer groups',
                        style: smallTextStyle?.copyWith(
                            color: manatee)),
                    Text(
                      getGroupsNames(priceList),
                      style: mediumTextStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(4.0)),
                      color: context
                          .theme.scaffoldBackgroundColor),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Last edited',
                          style: smallTextStyle?.copyWith(
                              color: manatee)),
                      Text(priceList.updatedAt.formatDate(),
                          style: mediumTextStyle),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(4.0)),
                      color: context
                          .theme.scaffoldBackgroundColor),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price overrides',
                          style: smallTextStyle?.copyWith(
                              color: manatee)),
                      Text(
                          priceList.prices?.length.toString() ??
                              '0',
                          style: mediumTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
