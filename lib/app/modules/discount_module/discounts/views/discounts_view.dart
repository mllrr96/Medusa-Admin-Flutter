import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../components/discount_rule_type_label.dart';
import '../controllers/discounts_controller.dart';

class DiscountsView extends GetView<DiscountsController> {
  const DiscountsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Discounts'),
        actions: [
          AdaptiveIcon(
              onPressed: () async {
                final result = await Get.toNamed(Routes.ADD_UPDATE_DISCOUNT);
                if (result is bool && result == true) {
                  controller.pagingController.refresh();
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: PagedListView(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Discount>(
            itemBuilder: (context, discount, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(discount.code ?? ''),
                        if(discount.rule?.description?.isNotEmpty ?? false)
                          const SizedBox(height: 12.0),
                        if(discount.rule?.description?.isNotEmpty ?? false)
                        Text(discount.rule?.description ?? ''),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DiscountStatusDot(disabled: discount.isDisabled ?? true),
                        const SizedBox(height: 12.0),
                        DiscountRuleTypeLabel(discount: discount),
                      ],
                    ),
                  ],
                ),
              );
            },
            firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive()),
            noItemsFoundIndicatorBuilder: (_) => Center(
                child: Text('No discounts yet!\n Tap on + to add discount',
                    style: largeTextStyle, textAlign: TextAlign.center)),
          ),
          // separatorBuilder: (_, __) =>
          //     GetPlatform.isAndroid ? const Divider(height: 0) : const Divider(height: 0, indent: 16.0),
        ),
      ),
    );
  }
}
