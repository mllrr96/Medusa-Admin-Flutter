import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard(this.discount,
      {super.key, this.onToggle, this.onDelete, this.onTap});
  final Promotion discount;
  final void Function()? onToggle;
  final void Function()? onDelete;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    Color? iconColor;
    switch (discount.type) {
      case PromotionType.standard:
        iconColor = Colors.orangeAccent;
        break;
      case PromotionType.buyget:
        iconColor = Colors.blueAccent;
        break;
      case null:
        break;
    }
    return Card(
      margin: EdgeInsets.zero,
      // color: context.getAlphaBlend(context.theme.cardColor),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        onTap: onTap ??
            () => context.pushRoute(DiscountDetailsRoute(discount: discount)),
        child: Ink(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Icon(Icons.discount_outlined,
                              size: 20, color: iconColor ?? manatee),
                          const SizedBox(width: 6.0),
                          Flexible(child: Text(discount.code ?? '')),
                        ],
                      ),
                    ),
                    IconButton(
                        padding: const EdgeInsets.all(16.0),
                        onPressed: () async {
                          await showModalActionSheet<int>(
                              title: 'Manage discount',
                              message: discount.code ?? '',
                              context: context,
                              actions: <SheetAction<int>>[
                                // const SheetAction(label: 'Edit', key: 0),
                                // !discount.isDisabled
                                //     ? const SheetAction(
                                //         label: 'Disable', key: 1)
                                //     : const SheetAction(
                                //         label: 'Enable', key: 1),
                                const SheetAction(
                                    label: 'Delete',
                                    isDestructiveAction: true,
                                    key: 2),
                              ]).then((value) async {
                            if (value == null) {
                              return;
                            }
                            switch (value) {
                              case 0:
                                // await context
                                //     .pushRoute(AddUpdateDiscountRoute(
                                //         discount: discount))
                                //     .then((value) {
                                //   if (value is bool && value == true) {
                                //     // DiscountsController
                                //     //     .instance.pagingController
                                //     //     .refresh();
                                //   }
                                // });
                                break;
                              case 1:
                                onToggle?.call();
                                break;
                              case 2:
                                await showOkCancelAlertDialog(
                                        context: context,
                                        title: 'Delete Promotion',
                                        message:
                                            'Are you sure you want to delete this promotion?',
                                        okLabel: 'Yes, delete',
                                        cancelLabel: 'Cancel',
                                        isDestructiveAction: true)
                                    .then((value) async {
                                  if (value == OkCancelResult.ok) {
                                    onDelete?.call();
                                  }
                                });
                                break;
                            }
                          });
                        },
                        icon: const Icon(Icons.more_horiz)),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // if (discount.rule?.description?.isNotEmpty ?? false)
                //     //   Flexible(
                //     //     child: Text(
                //     //       discount.rule?.description ?? '',
                //     //       style: smallTextStyle?.copyWith(color: manatee),
                //     //     ),
                //     //   ),
                //   ],
                // ),
                // PromotionTypeLabel(discount: discount),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // DiscountStatusDot(
                      //     disabled: discount.isDisabled ?? true),
                      // Flexible(
                      //   child: Text(
                      //     'Redemptions: ${discount.usageCount}',
                      //     style: smallTextStyle?.copyWith(color: manatee),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
