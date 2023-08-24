import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import '../components/index.dart';
import '../controllers/discount_conditions_controller.dart';

class DiscountConditionsView extends GetView<DiscountConditionsController> {
  const DiscountConditionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveCloseButton(),
        title: const Text('Discount Conditions'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          children: [
            if (controller.disabledConditions.where((element) => element == DiscountConditionType.products).isEmpty)
              Column(
                children: [
                  ConditionCard(
                      title: 'Product',
                      subtitle: 'Only for specific products',
                      onTap: () async {
                        final result = await Get.to(() => const ConditionProductView());
                        if (result is DiscountConditionRes) {
                          Get.back(result: result);
                        }
                      }),
                  space,
                ],
              ),
            if (controller.disabledConditions
                .where((element) => element == DiscountConditionType.customerGroups)
                .isEmpty)
              Column(
                children: [
                  ConditionCard(
                    title: 'Customer group',
                    subtitle: 'Only for specific customer group',
                    onTap: () async {
                      final result = await Get.to(() => const ConditionCustomerGroupView());
                      if (result is DiscountConditionRes) {
                        Get.back(result: result);
                      }
                    },
                  ),
                  space,
                ],
              ),
            if (controller.disabledConditions.where((element) => element == DiscountConditionType.productTags).isEmpty)
              Column(
                children: [
                  ConditionCard(
                    title: 'Tag',
                    subtitle: 'Only for specific tags',
                    onTap: () async {
                      final result = await Get.to(() => const ConditionTagView());
                      if (result is DiscountConditionRes) {
                        Get.back(result: result);
                      }
                    },
                  ),
                  space,
                ],
              ),
            if (controller.disabledConditions
                .where((element) => element == DiscountConditionType.productCollections)
                .isEmpty)
              Column(
                children: [
                  ConditionCard(
                    title: 'Collection',
                    subtitle: 'Only for specific product collections',
                    onTap: () async {
                      final result = await Get.to(() => const ConditionCollectionView());
                      if (result is DiscountConditionRes) {
                        Get.back(result: result);
                      }
                    },
                  ),
                  space,
                ],
              ),
            if (controller.disabledConditions.where((element) => element == DiscountConditionType.productType).isEmpty)
              ConditionCard(
                title: 'Type',
                subtitle: 'Only for specific product types',
                onTap: () async {
                  final result = await Get.to(() => const ConditionTypeView());
                  if (result is DiscountConditionRes) {
                    Get.back(result: result);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
