import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/store/product.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_button.dart';
import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Details'),
        centerTitle: true,
        actions: [
          AdaptiveButton(
              onPressed: () async {
                if (controller.state == null) {
                  return;
                }
                await showModalActionSheet(context: context, actions: <SheetAction>[
                  const SheetAction(label: 'Edit', key: 0),
                  const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
                ]).then((result) async {
                  if (result == 0) {
                    await Get.toNamed(Routes.CREATE_COLLECTION, arguments: [controller.state!, true])?.then((result) async {
                      if(result !=null){
                        await controller.loadCollection();
                      }
                    });
                  } else if (result == 1) {
                    await showOkCancelAlertDialog(
                        context: context,
                        title: 'Confirm deletion',
                        message: 'Are you sure you wanna delete this collection?',
                        isDestructiveAction: true);
                  }
                });
              },
              child: const Icon(Icons.more_horiz))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: controller.obx(
            (collection) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              // color: Theme.of(context).appBarTheme.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(collection!.title ?? '', style: largeTextStyle),
                      const SizedBox(height: 6.0),
                      Text('/${collection.handle ?? ''}', style: smallTextStyle),
                    ],
                  ),
                  if (collection.products != null && collection.products!.isNotEmpty)
                    AdaptiveButton(
                        onPressed: () async {}, iosPadding: EdgeInsets.zero, child: const Text('Edit Products'))
                ],
              ),
            ),
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
                  AdaptiveButton(onPressed: () {}, child: const Text('Add Products'))
                ],
              ),
            );
          }
          return ListView.builder(
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
                            imageUrl: product.thumbnail!,
                            placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                            errorWidget: (context, string, error) =>
                                const Icon(Icons.warning_rounded, color: Colors.redAccent),
                          ))
                      : null,
                  trailing: IconButton(
                      onPressed: () async {
                        await showModalActionSheet(context: context, actions: <SheetAction>[
                          const SheetAction(label: 'Edit'),
                          SheetAction(
                              label: product.status == ProductStatus.published ? 'Unpublish' : 'Publish',
                              key: 'publish'),
                          const SheetAction(label: 'Duplicate'),
                          const SheetAction(label: 'Delete', isDestructiveAction: true, key: 'delete'),
                        ]).then((result) async {});
                      },
                      icon: const Icon(Icons.more_horiz)),
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
