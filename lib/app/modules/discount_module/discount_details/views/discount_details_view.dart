import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/components/discount_rule_type_label.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../../discounts/controllers/discounts_controller.dart';
import '../controllers/discount_details_controller.dart';

class DiscountDetailsView extends GetView<DiscountDetailsController> {
  const DiscountDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    Widget discountValueText(Discount discount) {
      String value = '';
      String detail = '';

      switch (discount.rule!.type!) {
        case DiscountRuleType.fixed:
          value = '${discount.rule!.value!}';
          detail = ' ${discount.regions!.first.currencyCode ?? ''}';
          break;
        case DiscountRuleType.percentage:
          value = discount.rule!.value!.toString();
          detail = ' %';
          break;
        case DiscountRuleType.freeShipping:
          value = 'Free shipping';
          break;
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(child: Text(value, style: Theme.of(context).textTheme.bodyLarge)),
          if (detail.isNotEmpty) Text(detail.toUpperCase(), style: smallTextStyle?.copyWith(color: lightWhite)),
        ],
      );
    }

    final bottomNavBar = controller.obx(
        (discount) => Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom,
                left: 12.0,
                right: 12,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdaptiveButton(
                      onPressed: () async {
                        await showOkCancelAlertDialog(
                                context: context,
                                title: 'Delete Promotion',
                                message: 'Are you sure you want to delete this promotion?',
                                okLabel: 'Yes, delete',
                                cancelLabel: 'Cancel',
                                isDestructiveAction: true)
                            .then((value) async {
                          if (value == OkCancelResult.ok) {
                            await controller.deleteDiscount();
                          }
                        });
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.delete_forever, color: Colors.red),
                          SizedBox(width: 6.0),
                          Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      )),
                  AdaptiveButton(
                      onPressed: () async {
                        await Get.toNamed(Routes.ADD_UPDATE_DISCOUNT, arguments: discount!.id)?.then((value) async {
                          if (value is bool && value == true) {
                            await controller.loadDiscount();
                            DiscountsController.instance.pagingController.refresh();
                          }
                        });
                      },
                      child: const Text('Edit')),
                ],
              ),
            ),
        onLoading: const SizedBox.shrink(),
        onError: (_) => const SizedBox.shrink());

    Widget discountDetails(Discount discount) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discount.code ?? '',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                DiscountStatusDot(disabled: discount.isDisabled ?? true),
              ],
            ),
            if (discount.rule?.description?.isNotEmpty ?? false) space,
            if (discount.rule?.description?.isNotEmpty ?? false)
              Text(discount.rule?.description ?? '', style: smallTextStyle?.copyWith(color: lightWhite)),
            space,
            // Divider(),
            // space,
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        discountValueText(discount),
                        Text('Discount Amount', style: smallTextStyle?.copyWith(color: lightWhite))
                      ],
                    ),
                  ),
                  const VerticalDivider(width: 0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(discount.regions?.length.toString() ?? '', style: Theme.of(context).textTheme.bodyLarge),
                        Text('Valid Regions', style: smallTextStyle?.copyWith(color: lightWhite))
                      ],
                    ),
                  ),
                  const VerticalDivider(width: 0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(discount.usageCount.toString(), style: Theme.of(context).textTheme.bodyLarge),
                        Text('Total Redemptions', style: smallTextStyle?.copyWith(color: lightWhite))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget configurations(Discount discount) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Configurations'),
            space,
            if (discount.startsAt != null)
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Date', style: mediumTextStyle?.copyWith(color: lightWhite)),
                          halfSpace,
                          Text(DateFormat.yMMMEd().format(discount.startsAt!), style: mediumTextStyle),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Time', style: mediumTextStyle?.copyWith(color: lightWhite)),
                          halfSpace,
                          Text(DateFormat.jm().format(discount.startsAt!), style: mediumTextStyle),
                        ],
                      ),
                    ],
                  )),
            space,
            if (discount.endsAt != null)
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expiry Date', style: mediumTextStyle?.copyWith(color: lightWhite)),
                          halfSpace,
                          Text(
                            DateFormat.yMMMEd().format(discount.endsAt!),
                            style: mediumTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expiry Time', style: mediumTextStyle?.copyWith(color: lightWhite)),
                          halfSpace,
                          Text(DateFormat.jm().format(discount.endsAt!), style: mediumTextStyle),
                        ],
                      ),
                    ],
                  )),
            if (discount.endsAt != null) space,
          ],
        ),
      );
    }

    Widget conditions(Discount discount) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Conditions'),
            if (discount.rule?.conditions?.isEmpty ?? true)
              Text('This discount has no conditions', style: smallTextStyle?.copyWith(color: lightWhite)),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: const AdaptiveBackButton(),
          title: const Text('Discount Details'),
        ),
        bottomNavigationBar: bottomNavBar,
        body: SafeArea(
            child: controller.obx(
          (discount) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            children: [
              discountDetails(discount!),
              space,
              configurations(discount),
              space,
              conditions(discount),
            ],
          ),
          onError: (e) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Error loading discount \n ${e ?? ''}',
                style: mediumTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0),
              AdaptiveButton(onPressed: () async => await controller.loadDiscount(), child: const Text('Retry')),
            ],
          ),
          onLoading: const Center(child: CircularProgressIndicator.adaptive()),
        )));
  }
}
