import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'dart:io';
import '../../discount_conditions/components/condition_card.dart';
import '../../discount_conditions/controllers/discount_conditions_controller.dart';
import '../controllers/add_update_discount_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class ConditionExpansionTile extends GetView<AddUpdateDiscountController> {
  const ConditionExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);

    return GetBuilder<AddUpdateDiscountController>(
        id: 3,
        builder: (controller) {
          return FlexExpansionTile(
            key: controller.conditionsKey,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await controller.conditionsKey.currentContext
                    .ensureVisibility();
              }
            },
            initiallyExpanded: controller.updateMode,
            title: Text('Conditions', style: context.bodyLarge),
            childPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Column(
              children: <Widget>[
                if (controller.discountConditions.isEmpty)
                  Text(
                    'Discount code apply to all products if left untouched.',
                    style: smallTextStyle?.copyWith(color: manatee),
                  ),
                if (controller.discountConditions.isEmpty) space,
                if (controller.discountConditions.isNotEmpty)
                  ListView.separated(
                      separatorBuilder: (_, __) => space,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.discountConditions.length,
                      itemBuilder: (context, index) {
                        final condition = controller.discountConditions[index];
                        return DetailedConditionCard(
                          discountCondition: condition,
                          onDeleteTap: () async {
                            controller.discountConditions.remove(condition);
                            controller.update([3]);
                          },
                        );
                      }),
                if (controller.discountConditions.length < 5)
                  TextButton(
                      onPressed: () async {
                        final result = await context.pushRoute(
                            DiscountConditionsRoute(
                                discountConditionReq: DiscountConditionReq(
                                    discountTypes: controller.discountConditions
                                        .map((e) => e.type!)
                                        .toList())));
                        if (result is DiscountConditionRes) {
                          controller.discountConditions.add(DiscountCondition(
                            type: result.conditionType,
                            operator: result.operator,
                            products: result.products,
                            productTags: result.productTags,
                            productCollections: result.productCollections,
                            productTypes: result.productTypes,
                            discountRuleId: null,
                          ));
                          controller.update([3]);
                          await controller.conditionsKey.currentContext
                              .ensureVisibility();
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (Platform.isAndroid) const Icon(Icons.add),
                          if (Platform.isIOS) const Icon(CupertinoIcons.add),
                          const Gap(6),
                          const Text('Add Condition'),
                        ],
                      ))
              ],
            ),
          );
        });
  }
}
