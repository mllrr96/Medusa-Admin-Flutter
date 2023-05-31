import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/collections_module/collections/views/collections_view.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../components/keep_alive_widget.dart';
import '../components/products_app_bar.dart';
import '../controllers/products_controller.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) {
        final tabController = controller.tabController;
        return Scaffold(
          appBar: ProductsAppBar(tabController: tabController, topViewPadding: MediaQuery.of(context).viewPadding.top),
          body: SafeArea(
              child: TabBarView(
            controller: tabController,
            children: [
              KeepAliveWidget(
                  child:
                      controller.viewOptions == ViewOptions.grid ? const ProductsGridView() : const ProductsListView()),
              const KeepAliveWidget(child: CollectionsView()),
            ],
          )),
        );
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
          : const MaterialClassicHeader(color: Colors.green,),
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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        closeButtonHeroTag: 'product',
        openButtonHeroTag: 'product2',
        type: ExpandableFabType.fan,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {},
            child: const Icon(MedusaIcons.arrow_down_tray),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {},
            child: const Icon(MedusaIcons.arrow_up_tray),
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
            child: const Icon(MedusaIcons.plus_mini, color: Colors.white),
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
      title: Text(product.title!),
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
      trailing:AdaptiveIcon(onPressed: ()async{
        await showModalActionSheet(
            title: 'Manage Product',
            message: product.title ?? '',
            context: context,
            actions: <SheetAction>[
              const SheetAction(label: 'Edit'),
              SheetAction(label: product.status == ProductStatus.published ? 'Unpublish' : 'Publish', key: 'publish'),
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
      }, icon:const Icon(Icons.more_horiz) ,)

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
