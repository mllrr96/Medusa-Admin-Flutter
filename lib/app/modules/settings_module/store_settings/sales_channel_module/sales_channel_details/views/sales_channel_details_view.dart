import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/pick_products/controllers/pick_products_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../data/models/store/product.dart';
import '../../../../../../data/models/store/sales_channel.dart';
import '../../../../../../data/repository/collection/collection_repo.dart';
import '../../../../../../data/repository/product/products_repo.dart';
import '../../../../../../data/repository/product_tag/product_tag_repo.dart';
import '../../../../../../data/repository/sales_channel/sales_channel_repo.dart';
import '../../../../../components/pick_products/views/pick_products_view.dart';
import '../../../../../products_module/products/components/products_filter_view.dart';
import '../components/index.dart';
import '../controllers/sales_channel_details_controller.dart';

@RoutePage()
class SalesChannelDetailsView extends StatelessWidget {
  const SalesChannelDetailsView(this.salesChannel, {super.key});

  final SalesChannel salesChannel;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;

    return GetBuilder<SalesChannelDetailsController>(
      init: SalesChannelDetailsController(
        salesChannelRepo: SalesChannelRepo(),
        productsRepo: ProductsRepo(),
        collectionRepo: CollectionRepo(),
        productTagRepo: ProductTagRepo(),
        salesChannel: salesChannel,
      ),
      builder: (controller) {
        final disabled = controller.salesChannel.isDisabled != null &&
                controller.salesChannel.isDisabled!
            ? true
            : false;
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SalesChannelActiveDot(disabled),
                Text(controller.salesChannel.name ?? ''),
              ],
            ),
            bottom: controller.pagingController.itemList?.isEmpty ?? true
                ? null
                : PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: SizedBox(
                      height: kToolbarHeight,
                      child: Row(
                        children: [
                          const SizedBox(width: 4.0),
                          Checkbox(
                              value: controller.selectAll,
                              onChanged: (val) {
                                if (val == null) return;
                                if (val) {
                                  controller.selectedProducts.addAll(controller
                                          .pagingController.itemList
                                          ?.map((e) => e.id!) ??
                                      []);
                                  controller.selectAll = true;
                                } else {
                                  controller.selectedProducts.clear();
                                  controller.selectAll = false;
                                }
                                controller.update();
                              }),
                          InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0)),
                            onLongPress: () {
                              controller.resetFilter();
                            },
                            onTap: () async {
                              Future<ProductFilter?>
                                  productFilterView() async =>
                                      await showBarModalBottomSheet<
                                              ProductFilter>(
                                          context: context,
                                          overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                                          builder: (context) =>
                                              ProductsFilterView(
                                                onResetPressed: () {
                                                  controller.productFilter =
                                                      null;
                                                  controller.update();
                                                  controller.pagingController
                                                      .refresh();
                                                  context.popRoute();
                                                },
                                                productFilter:
                                                    controller.productFilter,
                                              ));
                              productFilterView().then((result) {
                                if (result is ProductFilter) {
                                  controller.productFilter = result;
                                  controller.update();
                                  controller.pagingController.refresh();
                                }
                              });
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: (controller.productFilter?.count() ??
                                                0) !=
                                            0
                                        ? ColorManager.primary
                                        : Colors.transparent),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(6.0)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Filters',
                                      style: context.bodySmall
                                          ?.copyWith(color: lightWhite)),
                                  if (controller.productFilter?.count() != null)
                                    Text(
                                        ' ${controller.productFilter?.count() ?? ''}',
                                        style: context.bodySmall?.copyWith(
                                            color: ColorManager.primary)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            actions: [
              AdaptiveIcon(
                  onPressed: () async {
                    await showModalActionSheet<int>(
                        title: 'Manage Sales Channel',
                        message: controller.salesChannel.name ?? '',
                        context: context,
                        actions: <SheetAction<int>>[
                          const SheetAction(label: 'Edit General Info', key: 0),
                          const SheetAction(label: 'Add Products', key: 1),
                          if (controller.pagingController.itemList?.isEmpty ??
                              false)
                            const SheetAction(
                                label: 'Delete',
                                isDestructiveAction: true,
                                key: 2),
                        ]).then((value) async {
                      switch (value) {
                        case 0:
                          // await Get.toNamed(Routes.ADD_UPDATE_SALES_CHANNEL, arguments: controller.salesChannel)
                          //     ?.then((result) {
                          //   if (result is SalesChannel) {
                          //     controller.salesChannel = result;
                          //     controller.update();
                          //     SalesChannelsController.instance.pagingController.refresh();
                          //   }
                          // });
                          break;
                        case 1:
                          final result = await showBarModalBottomSheet(
                            context: context,
                            overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                            builder: (context) => PickProductsView(
                              pickProductsReq: PickProductsReq(
                                disabledProducts:
                                    controller.pagingController.itemList,
                              ),
                            ),
                          );
                          if (result is PickProductsRes) {
                            final ids = result.selectedProducts
                                .map((e) => e.id!)
                                .toList();
                            await controller.addProducts(ids);
                          }
                          break;
                        case 2:
                          await controller.deleteChannel();
                          break;
                      }
                    });
                  },
                  icon: const Icon(Icons.more_horiz))
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: controller.selectedProducts.isNotEmpty
              ? SalesChannelFAB(controller)
              : null,
          body: SafeArea(
            child: SlidableAutoCloseBehavior(
              child: PagedListView.separated(
                separatorBuilder: (_, __) =>
                    const Divider(height: 0, indent: 16),
                padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Product>(
                  itemBuilder: (context, product, index) =>
                      ProductCheckboxListTile(product),
                  firstPageProgressIndicatorBuilder: (_) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  noItemsFoundIndicatorBuilder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Start building your channels setup...'),
                      const SizedBox(height: 12.0),
                      Text(
                        'You haven’t added any products to this channels yet,\nbut once you do they will live here.',
                        style: mediumTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12.0),
                      FilledButton(
                          onPressed: () async {
                            final result = await showBarModalBottomSheet(
                                context: context,
                                overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                                builder: (context) => PickProductsView(
                                        pickProductsReq: PickProductsReq(
                                      disabledProducts:
                                          controller.pagingController.itemList,
                                    )));
                            if (result is PickProductsRes) {
                              final ids = result.selectedProducts
                                  .map((e) => e.id!)
                                  .toList();

                              await controller.addProducts(ids);
                            }
                          },
                          child: const Text('Add products'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
