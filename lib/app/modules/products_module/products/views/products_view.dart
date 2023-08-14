import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/index.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: const ProductsAppBar(),
      endDrawer: const ProductsFilterView(),
      endDrawerEnableOpenDragGesture: false,
      floatingActionButton: SpeedDial(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        animatedIcon: AnimatedIcons.menu_close,
        spacing: 10,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'New Product',
            labelStyle: smallTextStyle,
            onTap: () async {
              await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)?.then((result) {
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
                await controller.updateProduct(product);
              },
            ),
            firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator.adaptive()),
            noItemsFoundIndicatorBuilder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.searchTerm.value.isEmpty && (controller.productFilter?.count() ?? 0) == 0)
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
                if ((controller.productFilter?.count() ?? 0) > 0 && controller.searchTerm.value.isEmpty)
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
