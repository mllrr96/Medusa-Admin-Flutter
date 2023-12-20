import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'dart:io';
import '../../../../data/models/store/discount_condition.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../discount_conditions/components/condition_card.dart';
import '../../discount_conditions/controllers/discount_conditions_controller.dart';
import '../controllers/add_update_discount_controller.dart';

class ConditionExpansionTile extends GetView<AddUpdateDiscountController> {
  const ConditionExpansionTile(this.viewContext, {super.key});
  final BuildContext viewContext;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    Future<void> scrollToSelectedContent(
        {required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240))
          .then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint = controller.scrollController.offset +
            yPosition -
            (viewContext.mediaQueryPadding.top + kToolbarHeight);
        if (scrollPoint <=
            controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController.animateTo(scrollPoint - 10,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(
              controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        }
      });
    }

    return GetBuilder<AddUpdateDiscountController>(
        id: 3,
        builder: (controller) {
          return CustomExpansionTile(
            key: controller.conditionsKey,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(
                    globalKey: controller.conditionsKey);
              }
            },
            initiallyExpanded: controller.updateMode,
            title: Text('Conditions', style: context.bodyLarge),
            expandedAlignment: Alignment.center,
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              if (controller.discountConditions.isEmpty)
                Text(
                  'Discount code apply to all products if left untouched.',
                  style: smallTextStyle?.copyWith(color: lightWhite),
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
                AdaptiveButton(
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
                          products: result.products?.map((e) => e.id!).toList(),
                          productTags:
                              result.productTags?.map((e) => e.id!).toList(),
                          productCollections: result.productCollections
                              ?.map((e) => e.id!)
                              .toList(),
                          productTypes:
                              result.productTypes?.map((e) => e.id!).toList(),
                        ));
                        controller.update([3]);
                        await scrollToSelectedContent(
                            globalKey: controller.conditionsKey);
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
          );
        });
  }
}
