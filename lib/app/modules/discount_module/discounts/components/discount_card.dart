import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/controllers/discounts_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:super_banners/super_banners.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_icon.dart';
import 'discount_rule_type_label.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard(this.discount, {Key? key, this.onToggle, this.onDelete}) : super(key: key);
  final Discount discount;
  final void Function()? onToggle;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    bool expired = discount.endsAt != null && discount.endsAt!.isBefore(DateTime.now());
    Color? iconColor;
    switch (discount.rule?.type) {
      case DiscountRuleType.fixed:
        iconColor = Colors.orangeAccent;
        break;
      case DiscountRuleType.percentage:
        iconColor = Colors.blueAccent;
        break;
      case DiscountRuleType.freeShipping:
        iconColor = Colors.green;
        break;
      case null:
        break;
    }
    final smallTextStyle = context.bodySmall;
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      onTap: () => Get.toNamed(Routes.DISCOUNT_DETAILS, arguments: discount.id!),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            if (expired)
              CornerBanner(
                bannerColor: Colors.red,
                bannerPosition: CornerBannerPosition.topRight,
                child: Text(
                  'Expired',
                  style: smallTextStyle?.copyWith(color: Colors.white, fontSize: 12),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                            Icon(Icons.discount_outlined, size: 20, color: iconColor ?? lightWhite),
                            const SizedBox(width: 6.0),
                            Flexible(child: Text(discount.code ?? '')),
                          ],
                        ),
                      ),
                      AdaptiveIcon(
                          onPressed: () async {
                            await showModalActionSheet<int>(
                                title: 'Manage discount',
                                message: discount.code ?? '',
                                context: context,
                                actions: <SheetAction<int>>[
                                  const SheetAction(label: 'Edit', key: 0),
                                  discount.isDisabled == null || !discount.isDisabled!
                                      ? const SheetAction(label: 'Disable', key: 1)
                                      : const SheetAction(label: 'Enable', key: 1),
                                  const SheetAction(label: 'Delete', isDestructiveAction: true, key: 2),
                                ]).then((value) async {
                              if (value == null) {
                                return;
                              }
                              switch (value) {
                                case 0:
                                  await Get.toNamed(Routes.ADD_UPDATE_DISCOUNT, arguments: discount)?.then((value) {
                                    if (value is bool && value == true) {
                                      DiscountsController.instance.pagingController.refresh();
                                    }
                                  });
                                  break;
                                case 1:
                                  if (onToggle != null) {
                                    onToggle!();
                                  }
                                  break;
                                case 2:
                                  await showOkCancelAlertDialog(
                                          context: context,
                                          title: 'Delete Promotion',
                                          message: 'Are you sure you want to delete this promotion?',
                                          okLabel: 'Yes, delete',
                                          cancelLabel: 'Cancel',
                                          isDestructiveAction: true)
                                      .then((value) async {
                                    if (value == OkCancelResult.ok) {
                                      if (onDelete != null) {
                                        onDelete!();
                                      }
                                    }
                                  });
                                  break;
                              }
                            });
                          },
                          icon: const Icon(Icons.more_horiz)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (discount.rule?.description?.isNotEmpty ?? false)
                        Flexible(
                          child: Text(
                            discount.rule?.description ?? '',
                            style: smallTextStyle?.copyWith(color: lightWhite),
                          ),
                        ),
                      DiscountRuleTypeLabel(discount: discount),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DiscountStatusDot(disabled: discount.isDisabled ?? true),
                        Flexible(
                          child: Text(
                            'Redemptions: ${discount.usageCount}',
                            style: smallTextStyle?.copyWith(color: lightWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
