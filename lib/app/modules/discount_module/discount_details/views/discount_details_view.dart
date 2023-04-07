import 'dart:io';
import 'dart:math';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/date_time_card.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/components/discount_rule_type_label.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../../data/models/req/user_discount_condition_req.dart';
import '../../discount_conditions/components/condition_card.dart';
import '../../discount_conditions/controllers/discount_conditions_controller.dart';
import '../../discounts/controllers/discounts_controller.dart';
import '../../update_condition/controllers/update_condition_controller.dart';
import '../controllers/discount_details_controller.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class DiscountDetailsView extends GetView<DiscountDetailsController> {
  const DiscountDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    Widget discountValueText(Discount discount) {
      String valueText = '';
      String detail = '';
      var value = discount.rule!.value!.roundToDouble();
      final valueFormatter = NumberFormat.currency(name: discount.regions!.first.currencyCode!);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      switch (discount.rule!.type!) {
        case DiscountRuleType.fixed:
          valueText = valueFormatter.format(value).split(valueFormatter.currencySymbol)[1];
          detail = ' ${discount.regions?.first.currency?.code ?? ''}';
          break;
        case DiscountRuleType.percentage:
          valueText = discount.rule!.value!.toString();
          detail = ' %';
          break;
        case DiscountRuleType.freeShipping:
          valueText = 'Free shipping';
          break;
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (discount.rule?.type == DiscountRuleType.fixed)
            Flexible(
                child: Text('${discount.regions?.first.currency?.symbolNative ?? ''} ',
                    style: Theme.of(context).textTheme.bodyLarge)),
          Flexible(child: Text(valueText, style: Theme.of(context).textTheme.bodyLarge)),
          if (detail.isNotEmpty) Text(detail.toUpperCase(), style: smallTextStyle?.copyWith(color: lightWhite)),
        ],
      );
    }

    Widget discountDetails(Discount discount) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discount.code ?? '',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                DiscountStatusDot(disabled: discount.isDisabled ?? true),
              ],
            ),
            if (discount.rule?.description?.isNotEmpty ?? false) space,
            if (discount.rule?.description?.isNotEmpty ?? false)
              Text(discount.rule?.description ?? '', style: smallTextStyle?.copyWith(color: lightWhite)),
            space,
            // Divider(),
            // space,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(discount.regions?.length.toString() ?? '', style: Theme.of(context).textTheme.bodyLarge),
                        Text('Valid Regions', style: smallTextStyle?.copyWith(color: lightWhite))
                      ],
                    ),
                  ),
                  const VerticalDivider(width: 0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(discount.usageCount.toString(), style: Theme.of(context).textTheme.bodyLarge),
                        Text('Total Redemptions', style: smallTextStyle?.copyWith(color: lightWhite))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget configurations(Discount discount) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Configurations'),
            space,
            if (discount.startsAt != null)
              DateTimeCard(
                dateTime: discount.startsAt,
                dateText: 'Start',
                dateTimeTextStyle: mediumTextStyle,
                dateTextStyle: mediumTextStyle?.copyWith(color: lightWhite),
                borderColor: Colors.transparent,
              ),
            space,
            if (discount.endsAt != null)
              DateTimeCard(
                dateTime: discount.endsAt,
                dateText: 'Expiry',
                dateTimeTextStyle: mediumTextStyle,
                dateTextStyle: mediumTextStyle?.copyWith(color: lightWhite),
                borderColor: Colors.transparent,
              ),
            if (discount.endsAt != null) space,
          ],
        ),
      );
    }

    Widget conditions(Discount discount) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Conditions'),
                AdaptiveIcon(
                    onPressed: () async {
                      final result = await Get.toNamed(Routes.DISCOUNT_CONDITIONS,
                          arguments: DiscountConditionReq(
                              discountTypes: discount.rule?.conditions?.map((e) => e.type!).toList() ?? []));
                      if (result != null && result is DiscountConditionRes) {
                        await controller.addCondition(
                            userCreateConditionReq: UserCreateConditionReq(
                          operator: result.operator,
                          productCollectionIds: result.productCollections?.map((e) => e.id!).toList(),
                          productIds: result.products?.map((e) => e.id!).toList(),
                          productTagsIds: result.productTags?.map((e) => e.id!).toList(),
                          productTypeIds: result.productTypes?.map((e) => e.id!).toList(),
                          customerGroupIds: result.customerGroups?.map((e) => e.id!).toList(),
                        ));
                      }
                    },
                    icon: Platform.isIOS
                        ? Icon(CupertinoIcons.add, color: ColorManager.primary)
                        : Icon(Icons.add, color: ColorManager.primary)),
              ],
            ),
            space,
            if (discount.rule?.conditions?.isEmpty ?? true)
              Text('This discount has no conditions', style: smallTextStyle?.copyWith(color: lightWhite)),
            if (discount.rule?.conditions?.isNotEmpty ?? false)
              ListView.separated(
                  separatorBuilder: (_, __) => space,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: discount.rule!.conditions!.length,
                  itemBuilder: (context, index) {
                    final condition = discount.rule!.conditions![index];
                    return DetailedConditionCard(
                      discountCondition: condition,
                      onEditTap: (val) async {
                        if (val == null) return;
                        final result = await Get.toNamed(Routes.UPDATE_CONDITION,
                            arguments: UpdateConditionReq(discountCondition: condition, discountConditionType: val));
                        if (result != null && result is UpdateConditionRes) {
                          if (result.updatedItemIds.isEmpty) {
                            await controller.deleteCondition(condition.id!);
                            return;
                          }

                          final addedItems =
                              result.updatedItemIds.toSet().difference(result.originalItemIds.toSet()).toList();
                          final deletedItems =
                              result.originalItemIds.toSet().difference(result.updatedItemIds.toSet()).toList();
                          await controller.updateCondition(
                              addedItems: addedItems, deletedItems: deletedItems, conditionId: condition.id!);
                        }
                      },
                      onDeleteTap: () async {
                        final result = await showOkCancelAlertDialog(
                          context: context,
                          title: 'Delete condition?',
                          message: 'Are you sure you want to delete this condition?',
                          okLabel: 'Yes, delete',
                          cancelLabel: 'Cancel',
                          isDestructiveAction: true,
                        );
                        if (result == OkCancelResult.ok) {
                          await controller.deleteCondition(condition.id!);
                        }
                      },
                    );
                  }),
            if (discount.rule?.conditions?.isNotEmpty ?? false) halfSpace,
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: const AdaptiveBackButton(),
          title: const Text('Discount Details'),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: controller.obx(
            (discount) => ExpandableFab(
                  key: controller.fabKey,
                  distance: 80,
                  type: ExpandableFabType.fan,
                  children: [
                    FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        onPressed: () async {
                          await showOkCancelAlertDialog(
                                  context: context,
                                  title: 'Delete Promotion',
                                  message: 'Are you sure you want to delete this promotion?',
                                  okLabel: 'Yes, delete',
                                  cancelLabel: 'Cancel',
                                  isDestructiveAction: true)
                              .then((value) async {
                            if (value == OkCancelResult.ok) {
                              await controller.deleteDiscount();
                            }
                          });
                          controller.fabKey.currentState?.toggle();
                        },
                        child: const Icon(MedusaIcons.trash)),
                    FloatingActionButton(
                        heroTag: null,
                        backgroundColor: ColorManager.primary,
                        foregroundColor: Colors.white,
                        onPressed: () async {
                          controller.fabKey.currentState?.toggle();
                          await Get.toNamed(Routes.ADD_UPDATE_DISCOUNT, arguments: discount!.id)?.then((value) async {
                            if (value is bool && value == true) {
                              await controller.loadDiscount();
                              DiscountsController.instance.pagingController.refresh();
                            }
                          });
                        },
                        child: const Icon(MedusaIcons.pencil_square_solid)),
                  ],
                ),
            onLoading: const SizedBox.shrink(),
            onError: (_) => const SizedBox.shrink()),
        body: SafeArea(
            child: controller.obx(
          (discount) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            children: [
              discountDetails(discount!),
              space,
              configurations(discount),
              space,
              conditions(discount),
            ],
          ),
          onError: (e) => SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error loading discount \n ${e ?? ''}',
                  style: mediumTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                AdaptiveButton(onPressed: () async => await controller.loadDiscount(), child: const Text('Retry')),
              ],
            ),
          ),
          onLoading: const Center(child: CircularProgressIndicator.adaptive()),
        )));
  }
}
