import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/enums.dart';
import '../../../collections_module/collections/controllers/collections_controller.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/search_text_field.dart';
import '../controllers/products_controller.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) {
        return controller.viewOptions == ViewOptions.grid ? const ProductsGridView() : const ProductsListView();
      },
    );
  }
}

class ProductsGridView extends GetView<ProductsController> {
  const ProductsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.gridRefreshController,
      onRefresh: () => controller.pagingController.refresh(),
      header: GetPlatform.isIOS
          ? const ClassicHeader(completeText: '')
          : const MaterialClassicHeader(
              color: Colors.green,
            ),
      child: PagedGridView(
        pagingController: controller.pagingController,
        // padding: const EdgeInsets.symmetric(vertical: 8.0),
        builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, product, index) => GestureDetector(
                  onTap: () async {
                    await Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product.id)?.then((result) {
                      // A product has been deleted, reload data
                      if (result is bool && result == true) {
                        controller.pagingController.refresh();
                      }
                    });
                  },
                  child: Card(
                    child: Column(
                      children: [
                        if (product.thumbnail != null)
                          Expanded(
                            flex: 3,
                            child: CachedNetworkImage(
                                key: ValueKey(product.thumbnail),
                                imageUrl: product.thumbnail!,
                                placeholder: (context, text) =>
                                    const Center(child: CircularProgressIndicator.adaptive()),
                                errorWidget: (context, string, error) =>
                                    const Icon(Icons.warning_rounded, color: Colors.redAccent)),
                          ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(product.title!, style: Theme.of(context).textTheme.titleMedium),
                        )),
                      ],
                    ),
                  ),
                ),
            firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive())),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 100 / 150,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}

class ProductsListView extends GetView<ProductsController> {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: const ProductsAppBar(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        // closeButtonHeroTag: 'product',
        // openButtonHeroTag: 'product2',
        type: ExpandableFabType.fan,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {},
            child: const Icon(MedusaIcons.arrow_down_tray, size: 20),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {},
            child: const Icon(MedusaIcons.arrow_up_tray, size: 20),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)?.then((result) {
                if (result != null && result is bool && result == true) {
                  controller.pagingController.refresh();
                }
              });
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: controller.listRefreshController,
        onRefresh: () => controller.pagingController.refresh(),
        header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
        child: PagedListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
          padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, product, index) => ProductListTile(
              product: product,
              onDelete: () async {
                final confirmDelete = await showOkCancelAlertDialog(
                    context: context,
                    title: 'Confirm product deletion',
                    message: 'Are you sure you want to delete this product? \n This action is irreversible',
                    isDestructiveAction: true);

                if (confirmDelete != OkCancelResult.ok) {
                  return;
                }
                await controller.deleteProduct(product.id!);
              },
              onPublish: () async {
                await controller.updateProduct(Product(
                  id: product.id!,
                  discountable: product.discountable,
                  status: product.status == ProductStatus.published ? ProductStatus.draft : ProductStatus.published,
                ));
              },
            ),
            firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator.adaptive()),
            noItemsFoundIndicatorBuilder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.searchTerm.value.isEmpty)
                  Column(
                    children: [
                      Text('No products yet!', style: mediumTextStyle),
                      const SizedBox(height: 12.0),
                      AdaptiveFilledButton(
                          onPressed: () async {
                            await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)?.then((result) {
                              if (result != null && result is bool && result == true) {
                                controller.pagingController.refresh();
                              }
                            });
                          },
                          child: const Text('Add product', style: TextStyle(color: Colors.white)))
                    ],
                  ),
                if (controller.searchTerm.value.isNotEmpty) Text('No products found', style: mediumTextStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key, required this.product, this.onTap, this.onDelete, this.onPublish}) : super(key: key);
  final Product product;
  final void Function()? onTap;
  final void Function()? onDelete;
  final void Function()? onPublish;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap ??
            () async {
              await Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product.id)?.then((result) {
                // A product has been deleted, reload data
                if (result is bool && result == true) {
                  // controller.pagingController.refresh();
                }
              });
            },
        title: Text(
          product.title!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getStatusIcon(product.status),
            const SizedBox(width: 4.0),
            Text(product.status.name.capitalize ?? product.status.name, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        leading: product.thumbnail != null
            ? SizedBox(
                width: 45,
                child: CachedNetworkImage(
                  key: ValueKey(product.thumbnail),
                  imageUrl: product.thumbnail!,
                  placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, string, error) => const Icon(Icons.warning_rounded, color: Colors.redAccent),
                ))
            : null,
        trailing: AdaptiveIcon(
          onPressed: () async {
            await showModalActionSheet(
                title: 'Manage Product',
                message: product.title ?? '',
                context: context,
                actions: <SheetAction>[
                  const SheetAction(label: 'Edit'),
                  SheetAction(
                      label: product.status == ProductStatus.published ? 'Unpublish' : 'Publish', key: 'publish'),
                  const SheetAction(label: 'Duplicate'),
                  const SheetAction(label: 'Delete', isDestructiveAction: true, key: 'delete'),
                ]).then((result) async {
              if (result == 'delete') {
                if (onDelete != null) {
                  onDelete!();
                }
              } else if (result == 'publish') {
                if (onPublish != null) {
                  onPublish!();
                }
              }
            });
          },
          icon: const Icon(Icons.more_horiz),
        )

        // AdaptiveIcon(
        //     onPressed: () async {
        //       await showModalActionSheet(context: context, actions: <SheetAction>[
        //         const SheetAction(label: 'Edit'),
        //         SheetAction(label: product.status == ProductStatus.published ? 'Unpublish' : 'Publish', key: 'publish'),
        //         const SheetAction(label: 'Duplicate'),
        //         const SheetAction(label: 'Delete', isDestructiveAction: true, key: 'delete'),
        //       ]).then((result) async {
        //         if (result == 'delete') {
        //           if (onDelete != null) {
        //             onDelete!();
        //           }
        //         } else if (result == 'publish') {
        //           if (onPublish != null) {
        //             onPublish!();
        //           }
        //         }
        //       });
        //     },
        //     icon: const Icon(Icons.more_horiz)),
        );
  }

  Widget _getStatusIcon(ProductStatus status) {
    switch (status) {
      case ProductStatus.draft:
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Icon(Icons.circle, color: Colors.grey, size: 10),
            Icon(Icons.circle, color: Colors.grey.withOpacity(0.17), size: 20),
          ],
        );
      case ProductStatus.proposed:
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Icon(Icons.circle, color: Colors.grey, size: 10),
            Icon(Icons.circle, color: Colors.grey.withOpacity(0.17), size: 20),
          ],
        );

      case ProductStatus.published:
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Icon(Icons.circle, color: Colors.green, size: 10),
            Icon(Icons.circle, color: Colors.green.withOpacity(0.17), size: 20),
          ],
        );

      case ProductStatus.rejected:
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Icon(Icons.circle, color: Colors.red, size: 10),
            Icon(Icons.circle, color: Colors.red.withOpacity(0.17), size: 20),
          ],
        );
    }
  }
}

class ProductsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProductsAppBar({super.key});

  @override
  State<ProductsAppBar> createState() => _ProductsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ProductsAppBarState extends State<ProductsAppBar> {
  bool collectionSearch = false;
  bool productSearch = false;
  final ProductsController controller = Get.find<ProductsController>();
  final collectionCtrl = CollectionsController.instance;
  final searchNode = FocusNode();
  IconData getSortIcon(SortOptions sortOptions) {
    switch (sortOptions) {
      case SortOptions.aZ:
        return Icons.sort_by_alpha;
      case SortOptions.zA:
        return Icons.sort_by_alpha;

      case SortOptions.dateRecent:
        return CupertinoIcons.calendar_badge_plus;

      case SortOptions.dateOld:
        return CupertinoIcons.calendar_badge_minus;
    }
  }

  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);

    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      height: kToolbarHeight,
      child: AnimatedCrossFade(
        key: const ValueKey(0),
        firstChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              const SizedBox(width: 12.0),
              Expanded(
                child: SearchTextField(
                  focusNode: searchNode,
                  controller: controller.searchCtrl,
                  hintText: 'Search for product name, variant title ...',
                  onChanged: (val) {
                    if (controller.searchTerm.value != val) {
                      controller.searchTerm.value = val;
                    }
                  },
                ),
              ),
              AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    // await Future.delayed(Duration(milliseconds: 150));
                    setState(() {
                      productSearch = false;
                      controller.searchCtrl.clear();
                      if (controller.searchTerm.value.isNotEmpty) {
                        controller.searchTerm.value = '';
                      }
                    });
                  }),
            ],
          ),
        ),
        secondChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AdaptiveIcon(
                    onPressed: () async {
                      setState(() => productSearch = true);
                      await Future.delayed(kDuration);
                      searchNode.requestFocus();
                    },
                    icon: const Icon(MedusaIcons.magnifying_glass),
                  ),
                  Obx(() {
                    return AdaptiveIcon(
                        onPressed: () async {
                          final sortOption = controller.sortOptions.value;
                          final result = await showModalActionSheet<SortOptions>(
                              context: context,
                              title: 'Sort products',
                              actions: <SheetAction<SortOptions>>[
                                SheetAction(
                                    label: 'A-Z',
                                    key: SortOptions.aZ,
                                    isDestructiveAction: sortOption == SortOptions.aZ),
                                SheetAction(
                                    label: 'Z-A',
                                    key: SortOptions.zA,
                                    isDestructiveAction: sortOption == SortOptions.zA),
                                SheetAction(
                                    label: 'Creation Date',
                                    key: SortOptions.dateRecent,
                                    isDestructiveAction: sortOption == SortOptions.dateRecent),
                                SheetAction(
                                    label: 'Creation Date - Ascending',
                                    key: SortOptions.dateOld,
                                    isDestructiveAction: sortOption == SortOptions.dateOld),
                              ]);
                          if (result != null) {
                            controller.changeSortOption(result);
                          }
                        },
                        icon: Icon(
                          getSortIcon(controller.sortOptions.value),
                          color: controller.sortOptions.value != SortOptions.dateRecent ? ColorManager.primary : null,
                        ));
                  }),
                  const SizedBox(width: 6.0),
                  InkWell(
                    onTap: () {
                      // showBarModalBottomSheet(
                      //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      //     context: context,
                      //     builder: (context) {
                      //       return Padding(
                      //         padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                      //         child: Container(
                      //           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      //           child: SingleChildScrollView(
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: [
                      //                 Theme(
                      //                   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      //                   child: ClipRRect(
                      //                     borderRadius: const BorderRadius.all(Radius.circular(12)),
                      //                     child: ExpansionTile(
                      //                       title: const Text('Status'),
                      //                       childrenPadding: const EdgeInsets.only(left: 20.0),
                      //                       children: ProductStatus.values
                      //                           .map((e) => CheckboxListTile(
                      //                               title: Text(e.value), value: false, onChanged: (val) {}))
                      //                           .toList(),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(height: 12.0),
                      //                 Theme(
                      //                   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      //                   child: ClipRRect(
                      //                     borderRadius: const BorderRadius.all(Radius.circular(12)),
                      //                     child: ExpansionTile(
                      //                       title: const Text('Collection'),
                      //                       childrenPadding: const EdgeInsets.only(left: 20.0),
                      //                       children: ProductStatus.values
                      //                           .map((e) => CheckboxListTile(
                      //                               title: Text(e.value), value: false, onChanged: (val) {}))
                      //                           .toList(),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(height: 12.0),
                      //                 Theme(
                      //                   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      //                   child: ClipRRect(
                      //                     borderRadius: const BorderRadius.all(Radius.circular(12)),
                      //                     child: ExpansionTile(
                      //                       title: const Text('Status'),
                      //                       childrenPadding: const EdgeInsets.only(left: 20.0),
                      //                       children: ProductStatus.values
                      //                           .map((e) => CheckboxListTile(
                      //                               title: Text(e.value), value: false, onChanged: (val) {}))
                      //                           .toList(),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     });
                    },
                    child: Chip(
                      side: const BorderSide(color: Colors.transparent),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Filters', style: Theme.of(context).textTheme.titleSmall),
                          Text(' 0',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.primary)),
                        ],
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     AdaptiveIcon(
              //         onPressed: () => controller.changeViewOption(),
              //         icon: Icon(controller.viewOptions == ViewOptions.list ? Icons.grid_view_rounded : Icons.list)),
              //     PullDownButton(
              //       itemBuilder: (context) => [
              //         PullDownMenuItem.selectable(
              //           selected: controller.viewOptions == ViewOptions.grid,
              //           title: 'Grid',
              //           icon: CupertinoIcons.square_grid_2x2,
              //           onTap: () => controller.changeViewOption(option: ViewOptions.grid),
              //         ),
              //         const PullDownMenuDivider(),
              //         PullDownMenuItem.selectable(
              //           selected: controller.viewOptions == ViewOptions.list,
              //           title: 'List',
              //           icon: CupertinoIcons.list_bullet,
              //           onTap: () => controller.changeViewOption(option: ViewOptions.list),
              //         ),
              //       ],
              //       position: PullDownMenuPosition.automatic,
              //       buttonBuilder: (context, showMenu) => AdaptiveButton(
              //         onPressed: showMenu,
              //         padding: EdgeInsets.zero,
              //         child: Icon(controller.viewOptions != ViewOptions.list ? Icons.grid_view_rounded : Icons.list,
              //             color: Theme.of(context).iconTheme.color),
              //       ),
              //     ),
              //     AdaptiveIcon(
              //         onPressed: () async {
              //           await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)?.then((result) {
              //             if (result != null && result is bool && result == true) {
              //               controller.pagingController.refresh();
              //             }
              //           });
              //         },
              //         icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add)),
              //     AdaptiveIcon(
              //         onPressed: () async {
              //           // ignore: unused_local_variable
              //           final result = await showModalActionSheet(context: context, actions: <SheetAction>[
              //             const SheetAction(label: 'Export Products'),
              //             const SheetAction(label: 'Import Products'),
              //           ]);
              //         },
              //         icon: const Icon(Icons.more_horiz)),
              //   ],
              // ),
            ],
          ),
        ),
        crossFadeState: productSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: kDuration,
      ),
    );
  }
}
