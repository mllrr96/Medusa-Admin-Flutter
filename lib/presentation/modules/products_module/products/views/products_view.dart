import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/domain/use_case/create_batch_job_use_case.dart';
import 'package:medusa_admin/domain/use_case/products_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../add_update_product/controllers/add_update_product_controller.dart';
import '../components/import_products.dart';
import '../components/index.dart';
import '../controllers/products_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    return GetBuilder<ProductsController>(
      init: ProductsController(productsUseCase: ProductsUseCase.instance),
      builder: (controller) {
        return Scaffold(
          drawer: const AppDrawer(),
          drawerEdgeDragWidth: context.drawerEdgeDragWidth,
          endDrawer: Drawer(
            // shape: const RoundedRectangleBorder(),
            child: ProductsFilterView(
              onResetPressed: () {
                controller.resetFilter();
                context.popRoute();
              },
              productFilter: controller.productFilter,
              onSubmitted: (productFilter) {
                if (productFilter == null) {
                  return;
                }
                controller.updateFilter(productFilter);
                context.popRoute();
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Directionality(
              textDirection:
                  context.isRTL ? TextDirection.rtl : TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpeedDial(
                    switchLabelPosition: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    icon: CupertinoIcons.doc_text_search,
                    spacing: 10,
                    children: [
                      SpeedDialChild(
                        child: const Icon(MedusaIcons.magnifying_glass_mini),
                        label: 'Search for a product',
                        labelStyle: smallTextStyle,
                        onTap: () => context.pushRoute(MedusaSearchRoute(
                            searchCategory: SearchCategory.products)),
                        onLongPress: () {},
                      ),
                      SpeedDialChild(
                        child: const Icon(CupertinoIcons.sort_up),
                        label: 'Sort',
                        labelStyle: smallTextStyle,
                        onTap: () async {
                          final sortOption = controller.sortOptions;
                          final result =
                              await showModalActionSheet<SortOptions>(
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
                  ),
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
                          await context
                              .pushRoute(
                                  AddUpdateProductRoute(updateProductReq: null))
                              .then((result) {
                            if (result is bool && result == true) {
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
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const ImportProductsView());
                        },
                        onLongPress: () {},
                      ),
                      SpeedDialChild(
                        child: const Icon(Icons.cloud_upload_rounded),
                        label: 'Export Products',
                        labelStyle: smallTextStyle,
                        onTap: () async {
                          await showOkCancelAlertDialog(
                            context: context,
                            title: 'Export Products',
                            message:
                                'Are you sure you want to initialize exporting all products?',
                            okLabel: 'Export',
                            cancelLabel: 'Cancel',
                          ).then((value) async {
                            if (value == OkCancelResult.ok) {
                              final result =
                                  await CreateBatchJobUseCase.instance(
                                      BatchJobType.productExport);
                              result.when((success) {
                                context.showSnackBar('Export started');
                              }, (error) {
                                context.showSnackBar(error.message);
                              });
                            }
                          });
                        },
                        onLongPress: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              MedusaSliverAppBar(
                title: Obx(
                      () => Text(
                      controller.productsCount.value != 0
                          ? 'Products (${controller.productsCount.value})'
                          : 'Products',
                      overflow: TextOverflow.ellipsis),
                ),
                actions: [
                  Builder(
                      builder: (context) => GetBuilder<ProductsController>(
                          builder: (controller) {
                            final iconColor =
                            (controller.productFilter?.count() ?? -1) > 0
                                ? Colors.red
                                : null;
                            return IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.sort, color: iconColor));
                          }))
                ],
              ),
            ],
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () => controller.pagingController.refresh(),
              // onRefresh: () async => await controller.refreshData(),
              child: PagedListView.separated(
                separatorBuilder: (_, __) =>
                const Divider(height: 0, indent: 16),
                padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Product>(
                  itemBuilder: (context, product, index) => ProductListTile(
                    product: product,
                    onEdit: () async {
                      final result = await context.pushRoute(
                          AddUpdateProductRoute(
                              updateProductReq: UpdateProductReq(
                                  product: product, number: 7)));
                      if (result != null) {
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
                    onDuplicate: () async {
                      await controller.duplicateProduct(product);
                    },
                  ),
                  firstPageProgressIndicatorBuilder: (_) =>
                  const ProductsLoadingPage(),
                  noItemsFoundIndicatorBuilder: (_) {
                    if ((controller.productFilter?.count() ?? -1) > 0) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No products found'),
                          const Gap(10.0),
                          FilledButton(
                              onPressed: () => controller.resetFilter(),
                              child: const Text('Clear filters'))
                        ],
                      );
                    }

                    return const Center(child: Text('No products'));
                  },
                  firstPageErrorIndicatorBuilder: (context) =>
                      PaginationErrorPage(
                          pagingController: controller.pagingController),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
