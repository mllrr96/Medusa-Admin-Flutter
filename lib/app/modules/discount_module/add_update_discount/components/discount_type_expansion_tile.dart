import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:medusa_admin/app/modules/discount_module/add_update_discount/controllers/add_update_discount_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'discount_allocation_type_card.dart';
import 'discount_type_card.dart';

class DiscountTypeExpansionTile extends GetView<AddUpdateDiscountController> {
  const DiscountTypeExpansionTile({super.key});


  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);

    return GetBuilder<AddUpdateDiscountController>(
        id: 0,
        builder: (controller) {
          return HeaderCard(
            key: controller.discountKey,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await controller.discountKey.currentContext.ensureVisibility();
              }
            },
            initiallyExpanded: true,
            title: const Text('Discount Type'),
            // expandedAlignment: Alignment.centerLeft,
            childPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Select a discount type',
                  style: smallTextStyle!.copyWith(color: manatee),
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
                              controller.generalFormKey.currentState!.reset();
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
                ,
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
                      ,
                    ],
                  )
                      : const SizedBox.shrink(
                  ),
                )
              ],
            ),
          );
        });

  }
}
