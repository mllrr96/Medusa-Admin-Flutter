import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/medusa_search/controllers/medusa_search_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../add_update_product/controllers/add_update_product_controller.dart';
import '../components/index.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      // appBar: const ProductsAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<ProductsController>(builder: (controller) {
              return SpeedDial(
                switchLabelPosition: true,
                backgroundColor: (controller.productFilter == null ||
                        controller.productFilter?.count() == 0)
                    ? null
                    : Colors.redAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                icon: CupertinoIcons.doc_text_search,
                spacing: 10,
                children: [
                  SpeedDialChild(
                    child: const Icon(MedusaIcons.magnifying_glass_mini),
                    label: 'Search for a product',
                    labelStyle: smallTextStyle,
                    onTap: () async {
                      await Get.toNamed(Routes.MEDUSA_SEARCH, arguments: SearchReq(searchCategory: SearchCategory.products));
                    },
                    onLongPress: () {},
                  ),
                  SpeedDialChild(
                    child: const Icon(CupertinoIcons.doc_text_search),
                    label: 'Filters',
                    labelStyle: smallTextStyle,
                    onTap: () async {
                      await showBarModalBottomSheet(
                          context: context,
                          builder: (context) => ProductsFilterView(
                                collections: controller.collections,
                                tags: controller.tags,
                                onResetPressed: () {
                                  controller.resetFilter();
                                  Get.back();
                                },
                                productFilter: controller.productFilter,
                              )).then((result) {
                        if (result is ProductFilter) {
                          controller.updateFilter(result);
                        }
                      });
                    },
                    onLongPress: () => controller.resetFilter(),
                  ),
                  SpeedDialChild(
                    child: const Icon(CupertinoIcons.sort_up),
                    label: 'Sort',
                    labelStyle: smallTextStyle,
                    onTap: () async {
                      final sortOption = controller.sortOptions;
                      final result = await showModalActionSheet<SortOptions>(
                          context: context,
                          title: 'Sort products',
                          actions: <SheetAction<SortOptions>>[
                            SheetAction(
                                label: 'A-Z',
                                key: SortOptions.aZ,
                                isDestructiveAction:
                                    sortOption == SortOptions.aZ),
                            SheetAction(
                                label: 'Z-A',
                                key: SortOptions.zA,
                                isDestructiveAction:
                                    sortOption == SortOptions.zA),
                            SheetAction(
                                label: 'Creation Date',
                                key: SortOptions.dateRecent,
                                isDestructiveAction:
                                    sortOption == SortOptions.dateRecent),
                            SheetAction(
                                label: 'Creation Date - Ascending',
                                key: SortOptions.dateOld,
                                isDestructiveAction:
                                    sortOption == SortOptions.dateOld),
                          ]);
                      if (result != null) {
                        controller.changeSortOption(result);
                      }
                    },
                    onLongPress: () {},
                  ),
                ],
              );
            }),
            SpeedDial(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              animatedIcon: AnimatedIcons.menu_close,
              spacing: 10,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.add),
                  label: 'New Product',
                  labelStyle: smallTextStyle,
                  onTap: () async {
                    await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)
                        ?.then((result) {
                      if (result != null && result is bool && result == true) {
                        controller.pagingController.refresh();
                      }
                    });
                  },
                  onLongPress: () {},
                ),
                SpeedDialChild(
                  child: const Icon(MedusaIcons.arrow_down_tray),
                  label: 'Import Products',
                  labelStyle: smallTextStyle,
                  onTap: () {},
                  onLongPress: () {},
                ),
                SpeedDialChild(
                  child: const Icon(Icons.cloud_upload_rounded),
                  label: 'Export Products',
                  labelStyle: smallTextStyle,
                  onTap: () {},
                  onLongPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: SmartRefresher(
        controller: controller.listRefreshController,
        onRefresh: () => controller.pagingController.refresh(),
        header: GetPlatform.isIOS
            ? const ClassicHeader(completeText: '')
            : const MaterialClassicHeader(),
        child: PagedListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
          padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, product, index) => ProductListTile(
              product: product,
              onEdit: ()async{
                final result =   await Get.toNamed(Routes.ADD_UPDATE_PRODUCT, arguments: UpdateProductReq(product: product, number: 7));
                if(result!=null){
                  controller.pagingController.refresh();
                }
              },
              onDelete: () async {
                final confirmDelete = await showOkCancelAlertDialog(
                    context: context,
                    title: 'Confirm product deletion',
                    message:
                        'Are you sure you want to delete this product? \n This action is irreversible',
                    isDestructiveAction: true);

                if (confirmDelete != OkCancelResult.ok) {
                  return;
                }
                await controller.deleteProduct(product.id!);
              },
              onPublish: () async {
                await controller.updateProduct(product);
              },
            ),
            firstPageProgressIndicatorBuilder: (_) =>
                const Center(child: CircularProgressIndicator.adaptive()),
            noItemsFoundIndicatorBuilder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.searchTerm.value.isEmpty &&
                    (controller.productFilter?.count() ?? 0) == 0)
                  Column(
                    children: [
                      Text('No products yet!', style: mediumTextStyle),
                      const SizedBox(height: 12.0),
                      AdaptiveFilledButton(
                          onPressed: () async {
                            await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)
                                ?.then((result) {
                              if (result != null &&
                                  result is bool &&
                                  result == true) {
                                controller.pagingController.refresh();
                              }
                            });
                          },
                          child: const Text('Add product',
                              style: TextStyle(color: Colors.white)))
                    ],
                  ),
                if (controller.searchTerm.value.isNotEmpty)
                  Text('No products found', style: mediumTextStyle),
                if ((controller.productFilter?.count() ?? 0) > 0 &&
                    controller.searchTerm.value.isEmpty)
                  Column(
                    children: [
                      Text('No products found', style: mediumTextStyle),
                      const SizedBox(height: 12.0),
                      AdaptiveButton(
                          onPressed: () {
                            controller.resetFilter();
                          },
                          child: const Text('Clear filters'))
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
