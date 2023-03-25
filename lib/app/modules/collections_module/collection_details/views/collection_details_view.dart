import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';

import '../../../../data/models/store/product.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_back_button.dart';
import '../../../components/adaptive_button.dart';
import '../../collections/controllers/collections_controller.dart';
import '../components/collection_products_list.dart';
import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Collection Details'),
        centerTitle: true,
        actions: [
          AdaptiveButton(
              onPressed: () async {
                if (controller.state == null) {
                  return;
                }
                await showModalActionSheet(context: context, actions: <SheetAction>[
                  const SheetAction(label: 'Edit Collection', key: 0),
                  const SheetAction(label: 'Delete Collection', isDestructiveAction: true, key: 1),
                ]).then((result) async {
                  if (result == 0) {
                    await Get.toNamed(Routes.CREATE_COLLECTION, arguments: [controller.state!, true])
                        ?.then((result) async {
                      if (result != null) {
                        await controller.loadCollection();
                      }
                    });
                  } else if (result == 1) {
                    await showOkCancelAlertDialog(
                            context: context,
                            // title: 'Confirm collection deletion',
                            message: 'Are you sure you want to delete this collection?',
                            okLabel: 'Yes, delete',
                            cancelLabel: 'No, cancel',
                            isDestructiveAction: true)
                        .then((result) async {
                      if (result == OkCancelResult.ok) await controller.deleteCollection();
                    });
                  }
                });
              },
              child: const Icon(Icons.more_horiz))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: controller.obx(
            (collection) => Container(
              height: kToolbarHeight,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              // color: Theme.of(context).appBarTheme.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(collection!.title ?? '', style: largeTextStyle),
                      // const SizedBox(height: 6.0),
                      Text('/${collection.handle ?? ''}', style: smallTextStyle!.copyWith(color: lightWhite)),
                    ],
                  ),
                  if (collection.products != null && collection.products!.isNotEmpty)
                    AdaptiveButton(
                        onPressed: () async {
                          final result = await Get.to(() => const CollectionProductsList(),
                              binding: CollectionProductsBinding(), arguments: collection.id!, fullscreenDialog: true);
                          if (result != null) {
                            await controller.loadCollection();
                            CollectionsController.instance.pagingController.refresh();
                          }
                        },
                        padding: EdgeInsets.zero,
                        child: const Text('Edit Products'))
                ],
              ),
            ),
            onLoading: const SizedBox.shrink(),
            onEmpty: const SizedBox.shrink(),
            onError: (e) => const SizedBox.shrink(),
          ),
        ),
      ),
      body: SafeArea(
          child: controller.obx(
        (collection) {
          if (collection!.products == null || collection.products!.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('No products on this collection'),
                  AdaptiveButton(
                      onPressed: () async {
                        final result = await Get.to(() => const CollectionProductsList(),
                            binding: CollectionProductsBinding(), arguments: collection.id!, fullscreenDialog: true);
                        if (result != null) {
                          await controller.loadCollection();
                          CollectionsController.instance.pagingController.refresh();
                        }
                      },
                      child: const Text('Add Products'))
                ],
              ),
            );
          }
          return ListView.separated(
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemCount: collection.products!.length,
              itemBuilder: (context, index) {
                final product = collection.products![index];
                return ListTile(
                  onTap: () async {
                    await Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product.id);
                  },
                  title: Text(product.title!),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getStatusIcon(product.status),
                      const SizedBox(width: 4.0),
                      Text(product.status.name.capitalize ?? product.status.name,
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
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
                  trailing: AdaptiveIcon(
                      onPressed: () async {
                        await showOkCancelAlertDialog(
                                context: context,
                                // title: 'Confirm your action',
                                message: 'Remove product from this collection?',
                                okLabel: 'Yes, remove',
                                cancelLabel: 'No, cancel',
                                isDestructiveAction: true)
                            .then((result) async {
                          if (result == OkCancelResult.ok) {
                            await controller.removeProduct(product.id!);
                          }
                        });
                      },
                      icon: const Icon(Icons.delete_forever, color: Colors.redAccent)),
                );
              });
        },
        onError: (e) => const Center(child: Text('Error loading collection details')),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
      )),
    );
  }

  Widget _getStatusIcon(ProductStatus status) {
    switch (status) {
      case ProductStatus.draft:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);
      case ProductStatus.proposed:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);

      case ProductStatus.published:
        return const Icon(Icons.circle, color: Colors.green, size: 12);

      case ProductStatus.rejected:
        return const Icon(Icons.circle, color: Colors.red, size: 12);
    }
  }
}
