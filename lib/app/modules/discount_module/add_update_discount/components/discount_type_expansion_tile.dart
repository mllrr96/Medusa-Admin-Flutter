import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/discount_module/add_update_discount/controllers/add_update_discount_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/store/discount_rule.dart';
import '../../../components/custom_expansion_tile.dart';
import 'discount_allocation_type_card.dart';
import 'discount_type_card.dart';

class DiscountTypeExpansionTile extends GetView<AddUpdateDiscountController> {
  const DiscountTypeExpansionTile(this.viewContext, {super.key});

  final BuildContext viewContext;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);
    Future<void> scrollToSelectedContent(
        {required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240))
          .then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box
            ?.localToGlobal(Offset.zero)
            .dy ?? 0.0;
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
        id: 0,
        builder: (controller) {
          return CustomExpansionTile(
            key: controller.discountKey,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: controller.discountKey);
              }
            },
            initiallyExpanded: true,
            title: Row(
              children: [
                Text('Discount Type', style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge),
                Text('*',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.redAccent)),
              ],
            ),
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'Select a discount type',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
              halfSpace,
              ...DiscountRuleType.values
                  .map((e) =>
                  Column(
                    children: [
                      DiscountTypeCard(
                        discountType: e,
                        groupValue: controller.discountRuleType,
                        onTap: (val) {
                          if (controller.discountRuleType != val) {
                            controller.discountRuleType = val;
                            controller.formKey.currentState!.reset();
                          }
                          if (val == DiscountRuleType.fixed &&
                              controller.selectedRegions.length > 1) {
                            controller.selectedRegions = [
                              controller.selectedRegions.first
                            ];
                            controller.regionCtrl.text =
                                controller.selectedRegions.first.name ?? '';
                          }
                          controller.update([0,1]);
                        },
                      ),
                      space,
                    ],
                  ))
                  .toList(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: controller.discountRuleType == DiscountRuleType.fixed
                    ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text('Allocation',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge),
                          Text('*',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.redAccent)),
                        ],
                      ),
                    ),
                    halfSpace,
                    ...AllocationType.values
                        .map((e) =>
                        Column(
                          children: [
                            DiscountAllocationTypeDiscount(
                              allocationType: e,
                              groupValue: controller.allocationType,
                              onTap: (val) {
                                controller.allocationType = val;
                                controller.update([0]);
                              },
                            ),
                            space,
                          ],
                        ))
                        .toList(),
                  ],
                )
                    : const SizedBox.shrink(
                ),
              )
            ],
          );
        });

  }
}
