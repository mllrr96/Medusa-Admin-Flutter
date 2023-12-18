import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/price_list.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/store/product.dart';
import '../../../discount_module/discounts/components/discount_rule_type_label.dart';
import '../controllers/price_list_details_controller.dart';

@RoutePage()
class PriceListDetailsView extends GetView<PriceListDetailsController> {
  const PriceListDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    String getGroupsNames(PriceList priceList) {
      String names = '';
      final nameList = priceList.customerGroups!.map((e) => e.name!).toList();
      for (var element in nameList) {
        if (names.isEmpty) {
          names = element;
        } else {
          names = '$names, $element';
        }
      }
      return names;
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Price List Details'),
        actions: [
          AdaptiveIcon(
              onPressed: () async {
                final result = await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                  const SheetAction(label: 'Edit price list details', key: 0),
                  const SheetAction(label: 'Remove price list', isDestructiveAction: true, key: 1),
                ]);

                switch (result) {
                  case 0:
                    Get.toNamed(Routes.ADD_UPDATE_PRICE_LIST, arguments: controller.id);
                    return;
                  case 1:
                    final confirmDelete = await showOkCancelAlertDialog(
                      context: context,
                      title: 'Delete price list',
                      message: 'Are you sure you want to delete this price list?',
                      okLabel: 'Yes, delete',
                      isDestructiveAction: true,
                    );
                    if (confirmDelete == OkCancelResult.ok) {
                      await controller.deletePriceList();
                    }
                    return;
                }
              },
              icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: SafeArea(
        child: controller.obx(
          (priceList) => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: Theme.of(context).expansionTileTheme.backgroundColor,
                  ),
                  // height: kToolbarHeight * 3,
                  // width: Get.width,
                  // color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            priceList!.name ?? '',
                            style: context.headlineMedium,
                          ),
                          DiscountStatusDot(disabled: priceList.status != PriceListStatus.active),
                        ],
                      ),
                      space,
                      Text(priceList.description ?? '', style: smallTextStyle?.copyWith(color: lightWhite)),
                      if (priceList.customerGroups?.isNotEmpty ?? false) space,
                      if (priceList.customerGroups?.isNotEmpty ?? false)
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                              color: Theme.of(context).scaffoldBackgroundColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Customer groups', style: smallTextStyle?.copyWith(color: lightWhite)),
                              Text(
                                getGroupsNames(priceList),
                                style: mediumTextStyle,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                color: Theme.of(context).scaffoldBackgroundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Last edited', style: smallTextStyle?.copyWith(color: lightWhite)),
                                Text(priceList.updatedAt.formatDate(), style: mediumTextStyle),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                color: Theme.of(context).scaffoldBackgroundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Price overrides', style: smallTextStyle?.copyWith(color: lightWhite)),
                                Text(priceList.prices?.length.toString() ?? '0', style: mediumTextStyle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PagedSliverList.separated(
                separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Product>(
                  itemBuilder: (context, product, index) => ListTile(
                    onTap: () async {
                      final result = await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                        const SheetAction(label: 'Edit prices', key: 0),
                        const SheetAction(label: 'Remove product', isDestructiveAction: true, key: 1),
                      ]);
                    },
                    leading: product.thumbnail != null
                        ? SizedBox(
                            width: 45,
                            child: CachedNetworkImage(
                              key: ValueKey(product.thumbnail),
                              imageUrl: product.thumbnail!,
                              placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                              errorWidget: (context, string, error) =>
                                  const Icon(Icons.warning_rounded, color: Colors.redAccent),
                            ))
                        : null,
                    title: Text(product.title ?? ''),
                    subtitle: product.collection != null
                        ? Text('${product.collection!.title} collection',
                            style: smallTextStyle?.copyWith(color: lightWhite))
                        : null,
                    trailing: Text('Variants: ${product.variants?.length ?? 'N/A'}', style: mediumTextStyle),
                  ),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  noItemsFoundIndicatorBuilder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: AdaptiveIcon(
                              onPressed: () async {
                                final result = await showModalActionSheet<int>(
                                    title: 'Prices settings',
                                    context: context,
                                    actions: <SheetAction<int>>[
                                      const SheetAction(label: 'Edit manually', key: 0),
                                      const SheetAction(label: 'Import price list', isDestructiveAction: true, key: 1),
                                    ]);
                              },
                              icon: const Icon(Icons.more_horiz)),
                        ),
                        Expanded(
                            child: Center(
                                child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('No prices added yet'),
                            const SizedBox(height: 12.0),
                            AdaptiveFilledButton(onPressed: () {}, child: const Text('Add Prices'))
                          ],
                        ))),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          onError: (e) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(e ?? 'Error loading products'),
                AdaptiveFilledButton(
                    onPressed: () async => await controller.fetchPriceList(), child: const Text('Retry')),
              ],
            ),
          ),
          onLoading: const Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}

class PriceListDetailsDelegate extends SliverPersistentHeaderDelegate {
  PriceListDetailsDelegate({required this.priceList});
  final PriceList priceList;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        // height: kToolbarHeight * 3,
        // width: Get.width,
        // color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  priceList.name ?? '',
                  style: context.headlineMedium,
                ),
                DiscountStatusDot(disabled: priceList.status != PriceListStatus.active),
              ],
            ),
            space,
            Text(priceList.description ?? '', style: smallTextStyle?.copyWith(color: lightWhite)),
            space,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(''),
                      Text('Customer groups', style: smallTextStyle?.copyWith(color: lightWhite))
                    ],
                  ),
                ),
                const VerticalDivider(width: 0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (priceList.updatedAt == null) Text('N/A', style: mediumTextStyle),
                      if (priceList.updatedAt != null)
                        Text(
                          priceList.updatedAt.formatDate(),
                          style: mediumTextStyle,
                        ),
                      Text('Last edited', style: smallTextStyle?.copyWith(color: lightWhite))
                    ],
                  ),
                ),
                const VerticalDivider(width: 0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(priceList.prices?.length.toString() ?? '0', style: mediumTextStyle),
                      Text('Price overrides', style: smallTextStyle?.copyWith(color: lightWhite))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 3.5;

  @override
  double get minExtent => kToolbarHeight * 3.5;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
