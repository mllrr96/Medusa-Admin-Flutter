import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/price_list_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import 'package:medusa_admin/app/modules/components/pick_products/controllers/pick_products_controller.dart';
import 'package:medusa_admin/app/modules/components/pick_products/views/pick_products_view.dart';
import 'package:medusa_admin/app/modules/pricing_module/price_list_details/components/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../controllers/price_list_details_controller.dart';

@RoutePage()
class PriceListDetailsView extends StatelessWidget {
  const PriceListDetailsView(this.priceList, {super.key});
  final PriceList priceList;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PriceListDetailsController>(
      init: PriceListDetailsController(
          priceListDetailsUseCase: PriceListDetailsUseCase.instance,
          id: priceList.id!),
      builder: (controller) {
        addProducts() async {
          await showBarModalBottomSheet(
            context: context,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
            builder: (context) => PickProductsView(
              pickProductsReq: PickProductsReq(
                disabledProducts: controller.pagingController.itemList,
                includeVariantCount: true,
              ),
            ),
          ).then((result) async {
            if (result is PickProductsRes) {
              final prices = await showBarModalBottomSheet(
                context: context,
                backgroundColor: context.theme.scaffoldBackgroundColor,
                enableDrag: false,
                overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                builder: (context) =>
                    PriceListAddProducts(result.selectedProducts),
              );
              if (prices is List<MoneyAmount> && context.mounted) {
                await controller.addPrices(context, prices);
              }
            }
          });
        }

        //
        // Scaffold Messenger is needed to prevent multiple heroes share same tag exception
        // check https://stackoverflow.com/questions/64677196/scaffoldmessenger-throws-a-hero-animation-error
        //
        return ScaffoldMessenger(
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              title: const Text('Price List Details'),
              actions: [
                IconButton(
                    onPressed: () async {
                      await showModalActionSheet<int>(
                          context: context,
                          actions: <SheetAction<int>>[
                            const SheetAction(
                                label: 'Edit price list details', key: 0),
                            const SheetAction(label: 'Add Products', key: 1),
                            const SheetAction(
                                label: 'Remove price list',
                                isDestructiveAction: true,
                                key: 2),
                          ]).then((result) async {
                        switch (result) {
                          case 0:
                            context.pushRoute(
                                AddUpdatePriceListRoute(id: controller.id));
                            return;
                          case 1:
                            await addProducts();
                            return;
                          case 2:
                            final confirmDelete = await showOkCancelAlertDialog(
                              context: context,
                              title: 'Delete price list',
                              message:
                                  'Are you sure you want to delete this price list?',
                              okLabel: 'Yes, delete',
                              isDestructiveAction: true,
                            );
                            if (confirmDelete == OkCancelResult.ok &&
                                context.mounted) {
                              await controller.deletePriceList(context);
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
                              itemBuilder: (context, product, index) =>
                                  PriceListProductTile(
                                product,
                                onEditPricesTap: () async {
                                  final result = await context.pushRoute(
                                      AddUpdateVariantsPriceRoute(
                                          product: product,
                                          prices: priceList.prices));
                                  if (result is List<MoneyAmount> &&
                                      context.mounted) {
                                    await controller.updatePrices(
                                        context, result);
                                  }
                                },
                                onRemoveProductTap: () async {
                                  await controller.deleteProduct(
                                      context, product);
                                },
                              ),
                              firstPageProgressIndicatorBuilder: (context) =>
                                  const PriceListProductsLoadingPage(),
                              noItemsFoundIndicatorBuilder: (context) {
                                return Center(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('No prices added yet'),
                                    const SizedBox(height: 12.0),
                                    FilledButton(
                                      onPressed: () async {
                                        await addProducts();
                                      },
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
                            Text(e ?? 'Error loading price list'),
                            FilledButton(
                                onPressed: () async =>
                                    await controller.fetchPriceList(),
                                child: const Text('Retry')),
                          ],
                        ),
                      ),
                  onLoading: PriceListLoadingPage(priceList)),
            ),
          ),
        );
      },
    );
  }
}
