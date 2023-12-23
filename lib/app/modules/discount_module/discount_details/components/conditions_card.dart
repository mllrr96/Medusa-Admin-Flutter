import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/req/user_discount_condition_req.dart';
import '../../discount_conditions/components/condition_card.dart';
import '../../discount_conditions/controllers/discount_conditions_controller.dart';
import '../../update_condition/controllers/update_condition_controller.dart';
import '../controllers/discount_details_controller.dart';

class ConditionsCard extends GetView<DiscountDetailsController> {
  const ConditionsCard(this.discount, {super.key});
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    const space = Gap(12);
    const halfSpace = Gap(6);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.theme.expansionTileTheme.backgroundColor,
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
                    final result  = await context.pushRoute(DiscountConditionsRoute(discountConditionReq: DiscountConditionReq(
                        discountTypes: discount.rule?.conditions?.map((e) => e.type!).toList() ?? [])));
                    if (result is DiscountConditionRes) {
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
            Column(
              children: [
                Center(child: Text('This discount has no conditions', style: context.bodyMedium?.copyWith(color: manatee))),
                const Gap(15),
              ],
            ),
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
                      final result = await context.pushRoute(UpdateConditionRoute(
                          updateConditionReq:  UpdateConditionReq(discountCondition: condition, discountConditionType: val)
                      ));
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
}
