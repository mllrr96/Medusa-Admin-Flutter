import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'discount_type_card.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class DiscountTypeExpansionTile extends StatelessWidget {
  const DiscountTypeExpansionTile({
    super.key,
    required this.discountType,
    // required this.allocationType,
    this.onTypeChange,
    // this.onAllocationChange
  });
  final PromotionType discountType;
  // final AllocationType allocationType;
  final void Function(PromotionType)? onTypeChange;
  // final void Function(AllocationType)? onAllocationChange;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);

    return FlexExpansionTile(
      maintainState: true,
      onExpansionChanged: (expanded) async {
        if (expanded && key is GlobalKey) {
          await (key as GlobalKey).currentContext?.ensureVisibility();
        }
      },
      initiallyExpanded: true,
      title: const Text('Discount Type'),
      // expandedAlignment: Alignment.centerLeft,
      childPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Select a discount type',
            style: smallTextStyle!.copyWith(color: manatee),
          ),
          halfSpace,
          ...PromotionType.values.map(
            (e) => Column(
              children: [
                DiscountTypeCard(
                  discountType: e,
                  groupValue: discountType,
                  onTap: onTypeChange,
                  // onTap: (val) {
                  //   if (controller.discountRuleType != val) {
                  //     controller.discountRuleType = val;
                  //     controller.generalFormKey.currentState!.reset();
                  //   }
                  //   if (val == PromotionType.fixed &&
                  //       controller.selectedRegions.length > 1) {
                  //     controller.selectedRegions = [
                  //       controller.selectedRegions.first
                  //     ];
                  //     controller.regionCtrl.text =
                  //         controller.selectedRegions.first.name ?? '';
                  //   }
                  //   controller.update([0, 1]);
                  // },
                ),
                halfSpace,
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: discountType == PromotionType.standard
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text('Allocation', style: context.bodyLarge),
                            Text('*',
                                style: context.bodyLarge
                                    ?.copyWith(color: Colors.redAccent)),
                          ],
                        ),
                      ),
                      halfSpace,
                      // ...AllocationType.values.map((e) => Column(
                      //       children: [
                      //         DiscountAllocationTypeDiscount(
                      //           allocationType: e,
                      //           groupValue: allocationType,
                      //           onTap: onAllocationChange,
                      //           // onTap: (val) {
                      //           //   controller.allocationType = val;
                      //           //   controller.update([0]);
                      //           // },
                      //         ),
                      //         space,
                      //       ],
                      //     )),
                    ],
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
