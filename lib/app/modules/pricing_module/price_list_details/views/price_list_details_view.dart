import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../discount_module/discounts/components/discount_rule_type_label.dart';
import '../components/price_list_details_tile.dart';
import '../controllers/price_list_details_controller.dart';

@RoutePage()
class PriceListDetailsView extends StatelessWidget {
  const PriceListDetailsView(this.id, {super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    return GetBuilder<PriceListDetailsController>(
        init:
            PriceListDetailsController(priceListRepo: PriceListRepo(), id: id),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Price List Details'),
              actions: [
                AdaptiveIcon(
                    onPressed: () async {
                      await showModalActionSheet<int>(
                          context: context,
                          actions: <SheetAction<int>>[
                            const SheetAction(
                                label: 'Edit price list details', key: 0),
                            const SheetAction(
                                label: 'Remove price list',
                                isDestructiveAction: true,
                                key: 1),
                          ]).then((result) async {
                        switch (result) {
                          case 0:
                            context.pushRoute(
                                AddUpdatePriceListRoute(id: controller.id));
                            return;
                          case 1:
                            final confirmDelete = await showOkCancelAlertDialog(
                              context: context,
                              title: 'Delete price list',
                              message:
                                  'Are you sure you want to delete this price list?',
                              okLabel: 'Yes, delete',
                              isDestructiveAction: true,
                            );
                            if (confirmDelete == OkCancelResult.ok) {
                              if (context.mounted) {
                                await controller.deletePriceList(context);
                              }
                            }
                            return;
                        }
                      });
                    },
                    icon: const Icon(Icons.more_horiz))
              ],
            ),
            body: SafeArea(
              child: controller.obx(
                (priceList) => CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: PriceListDetailsTile(priceList!),
                    ),
                    PagedSliverList.separated(
                      separatorBuilder: (_, __) =>
                          const Divider(height: 0, indent: 16),
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Product>(
                        itemBuilder: (context, product, index) => ListTile(
                          onTap: () async {
                            await showModalActionSheet<int>(
                                context: context,
                                actions: <SheetAction<int>>[
                                  const SheetAction(
                                      label: 'Edit prices', key: 0),
                                  const SheetAction(
                                      label: 'Remove product',
                                      isDestructiveAction: true,
                                      key: 1),
                                ]).then((result) async {
                              switch (result) {
                                case 0:
                                  final result = await context.pushRoute(
                                      AddUpdateVariantsPriceRoute(
                                          product: product,
                                          prices: priceList.prices));
                                  if (result is List<MoneyAmount> &&
                                      context.mounted) {
                                    await controller.updatePrices(
                                        context, result);
                                  }
                                  return;
                                case 1:
                                  final confirmDelete =
                                      await showOkCancelAlertDialog(
                                    context: context,
                                    title: 'Remove product',
                                    message:
                                        'Are you sure you want to remove this product?',
                                    okLabel: 'Yes, remove',
                                    isDestructiveAction: true,
                                  );
                                  if (confirmDelete == OkCancelResult.ok) {
                                    if (context.mounted) {
                                      await controller.deleteProduct(
                                          context, product);
                                    }
                                  }
                                  return;
                              }
                            });
                          },
                          leading: product.thumbnail != null
                              ? SizedBox(
                                  width: 45,
                                  child: CachedNetworkImage(
                                    key: ValueKey(product.thumbnail),
                                    imageUrl: product.thumbnail!,
                                    placeholder: (context, text) =>
                                        const Center(
                                            child: CircularProgressIndicator
                                                .adaptive()),
                                    errorWidget: (context, string, error) =>
                                        const Icon(Icons.warning_rounded,
                                            color: Colors.redAccent),
                                  ))
                              : null,
                          title: Text(product.title ?? ''),
                          subtitle: product.collection != null
                              ? Text('${product.collection!.title} collection',
                                  style:
                                      smallTextStyle?.copyWith(color: manatee))
                              : null,
                          trailing: Text(
                              'Variants: ${product.variants?.length ?? 'N/A'}',
                              style: mediumTextStyle),
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            Skeletonizer(
                              enabled: true,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
                                    title: const Text('Medusa Product'),
                                    subtitle: Text('collection',
                                        style:
                                        smallTextStyle?.copyWith(color: manatee))
                                       ,
                                    trailing: Text(
                                        'Variants: N/A',
                                        style: mediumTextStyle),
                                  ),
                                  ListTile(
                                    leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
                                    title: const Text('Medusa Product'),
                                    subtitle: Text('collection',
                                        style:
                                        smallTextStyle?.copyWith(color: manatee))
                                       ,
                                    trailing: Text(
                                        'Variants: N/A',
                                        style: mediumTextStyle),
                                  ),
                                  ListTile(
                                    leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
                                    title: const Text('Medusa Product'),
                                    subtitle: Text('collection',
                                        style:
                                        smallTextStyle?.copyWith(color: manatee))
                                       ,
                                    trailing: Text(
                                        'Variants: N/A',
                                        style: mediumTextStyle),
                                  ),
                                ],
                              ),
                            ),
                        noItemsFoundIndicatorBuilder: (context) {
                          return Center(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('No prices added yet'),
                              const SizedBox(height: 12.0),
                              FilledButton(
                                onPressed: () {},
                                child: const Text('Add Products'),
                              ),
                            ],
                          ));
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
                      FilledButton(
                          onPressed: () async =>
                              await controller.fetchPriceList(),
                          child: const Text('Retry')),
                    ],
                  ),
                ),
                onLoading:
                     Column(
                      children: [
                        PriceListDetailsTile(PriceList(type:PriceListType.sale , status:PriceListStatus.active,
                        name: 'Black Friday', description: 'Black Friday Sale',
                          updatedAt: DateTime.now(),
                        ), shimmer: true),
                        Skeletonizer(
                          enabled: true,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
                                title: const Text('Medusa Product'),
                                subtitle: Text('collection',
                                    style:
                                    smallTextStyle?.copyWith(color: manatee))
                                ,
                                trailing: Text(
                                    'Variants: N/A',
                                    style: mediumTextStyle),
                              ),
                              ListTile(
                                leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
                                title: const Text('Medusa Product'),
                                subtitle: Text('collection',
                                    style:
                                    smallTextStyle?.copyWith(color: manatee))
                                ,
                                trailing: Text(
                                    'Variants: N/A',
                                    style: mediumTextStyle),
                              ),
                              ListTile(
                                leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
                                title: const Text('Medusa Product'),
                                subtitle: Text('collection',
                                    style:
                                    smallTextStyle?.copyWith(color: manatee))
                                ,
                                trailing: Text(
                                    'Variants: N/A',
                                    style: mediumTextStyle),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
              ),
            ),
          );
        });
  }
}

class PriceListDetailsDelegate extends SliverPersistentHeaderDelegate {
  PriceListDetailsDelegate({required this.priceList});

  final PriceList priceList;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.theme.cardColor,
      ),
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
              DiscountStatusDot(
                  disabled: priceList.status != PriceListStatus.active),
            ],
          ),
          space,
          Text(priceList.description ?? '',
              style: smallTextStyle?.copyWith(color: manatee)),
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
                    Text('Customer groups',
                        style: smallTextStyle?.copyWith(color: manatee))
                  ],
                ),
              ),
              const VerticalDivider(width: 0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (priceList.updatedAt == null)
                      Text('N/A', style: mediumTextStyle),
                    if (priceList.updatedAt != null)
                      Text(
                        priceList.updatedAt.formatDate(),
                        style: mediumTextStyle,
                      ),
                    Text('Last edited',
                        style: smallTextStyle?.copyWith(color: manatee))
                  ],
                ),
              ),
              const VerticalDivider(width: 0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(priceList.prices?.length.toString() ?? '0',
                        style: mediumTextStyle),
                    Text('Price overrides',
                        style: smallTextStyle?.copyWith(color: manatee))
                  ],
                ),
              ),
            ],
          ),
        ],
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
