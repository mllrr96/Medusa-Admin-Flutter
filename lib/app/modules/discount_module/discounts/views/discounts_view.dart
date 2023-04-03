import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/discount_card.dart';
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
              icon: Platform.isAndroid ? const Icon(Icons.add) : const Icon(CupertinoIcons.add))
        ],
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Discount>(
              itemBuilder: (context, discount, index) {
                return DiscountCard(discount,
                    onDelete: () async => await controller.deleteDiscount(id: discount.id!),
                    onToggle: () async => await controller.toggleDiscount(discount: discount));
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
      ),
    );
  }
}
