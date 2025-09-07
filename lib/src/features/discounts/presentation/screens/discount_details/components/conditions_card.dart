import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/color_extension.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/features/discounts/presentation/bloc/discount_crud/discount_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class ConditionsCard extends StatelessWidget {
  const ConditionsCard(this.discount, {this.discountCrudBloc, super.key});
  final Promotion discount;
  final DiscountCrudBloc? discountCrudBloc;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    const halfSpace = Gap(6);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.getAlphaBlend(context.theme.cardColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Conditions'),
              IconButton(
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () async {
                    // final result = await context.pushRoute(
                    //     DiscountConditionsRoute(
                    //         discountConditionReq: DiscountConditionReq(
                    //             discountTypes: discount.rule?.conditions
                    //                     ?.map((e) => e.type!)
                    //                     .toList() ??
                    //                 [])));
                    // if (result is DiscountConditionRes && context.mounted) {
                    //   discountCrudBloc?.add(DiscountCrudEvent.addCondition(
                    //       discount.id,
                    //       CreateConditionReq(
                    //         operator: result.operator,
                    //         productCollectionIds: result.productCollections
                    //             ?.map((e) => e.id!)
                    //             .toList(),
                    //         productIds:
                    //             result.products?.map((e) => e.id!).toList(),
                    //         productTagsIds:
                    //             result.productTags?.map((e) => e.id!).toList(),
                    //         productTypeIds:
                    //             result.productTypes?.map((e) => e.id!).toList(),
                    //         customerGroupIds: result.customerGroups
                    //             ?.map((e) => e.id!)
                    //             .toList(),
                    //       )));
                    // }
                  },
                  icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add)),
            ],
          ),
          halfSpace,
          // if (discount.rule?.conditions?.isEmpty ?? true)
          Column(
            children: [
              Center(
                  child: Text('This discount has no conditions',
                      style: context.bodyMedium?.copyWith(color: manatee))),
              const Gap(15),
            ],
          ),
          // if (discount.rule?.conditions?.isNotEmpty ?? false)
          //   ListView.separated(
          //       separatorBuilder: (_, __) => space,
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: discount.rule!.conditions!.length,
          //       itemBuilder: (context, index) {
          //         final condition = discount.rule!.conditions![index];
          //         return DetailedConditionCard(
          //           discountCondition: condition,
          //           onEditTap: (val) async {
          //             if (val == null) return;
          //             final result = await context.pushRoute(
          //                 UpdateConditionRoute(
          //                     updateConditionReq: UpdateConditionReq(
          //                         discountCondition: condition,
          //                         discountConditionType: val)));
          //             if (result is UpdateConditionRes) {
          //               if (result.updatedItemIds.isEmpty) {
          //                 if (context.mounted) {
          //                   discountCrudBloc?.add(
          //                       DiscountCrudEvent.removeCondition(
          //                           discount.id, condition.id!));
          //                 }
          //                 return;
          //               }
          //               final addedItems = result.updatedItemIds
          //                   .toSet()
          //                   .difference(result.originalItemIds.toSet())
          //                   .toList();
          //               final deletedItems = result.originalItemIds
          //                   .toSet()
          //                   .difference(result.updatedItemIds.toSet())
          //                   .toList();
          //               if (context.mounted) {
          //                 if (addedItems.isNotEmpty) {
          //                   discountCrudBloc?.add(
          //                       DiscountCrudEvent.addItemsToCondition(
          //                           discount.id, condition.id!, addedItems));
          //                 }
          //                 if (deletedItems.isNotEmpty) {
          //                   discountCrudBloc?.add(
          //                       DiscountCrudEvent.removeItemsFromCondition(
          //                           discount.id, condition.id!, deletedItems));
          //                 }
          //               }
          //             }
          //           },
          //           onDeleteTap: () async {
          //             final result = await showOkCancelAlertDialog(
          //               context: context,
          //               title: 'Delete condition?',
          //               message:
          //                   'Are you sure you want to delete this condition?',
          //               okLabel: 'Yes, delete',
          //               cancelLabel: 'Cancel',
          //               isDestructiveAction: true,
          //             );
          //             if (result == OkCancelResult.ok) {
          //               if (context.mounted) {
          //                 discountCrudBloc?.add(
          //                     DiscountCrudEvent.removeCondition(
          //                         discount.id, condition.id!));
          //               }
          //             }
          //           },
          //         );
          //       }),
          // if (discount.rule?.conditions?.isNotEmpty ?? false) halfSpace,
        ],
      ),
    );
  }
}
