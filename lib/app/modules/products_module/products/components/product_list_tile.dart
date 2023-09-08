import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/store/product.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_icon.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key, required this.product, this.onTap, this.onDelete, this.onPublish, this.onEdit}) : super(key: key);
  final Product product;
  final void Function()? onTap;
  final void Function()? onDelete;
  final void Function()? onPublish;
  final void Function()? onEdit;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.only(left: 16.0),
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
            await showModalActionSheet<int>(
                title: 'Manage Product',
                message: product.title ?? '',
                context: context,
                actions: <SheetAction<int>>[
                  const SheetAction(label: 'Edit', key: 0),
                  SheetAction(
                      label: product.status == ProductStatus.published ? 'Unpublish' : 'Publish', key: 1),
                  const SheetAction(label: 'Duplicate', key: 2),
                  const SheetAction(label: 'Delete', isDestructiveAction: true, key: 3),
                ]).then((result) async {

                  switch(result){
                    case 0:
                      if(onEdit!=null){
                        onEdit!();
                      }
                    case 1:
                    if (onPublish != null) {
                      onPublish!();
                    }
                    case 2:
                    case 3:
                    if (onDelete != null) {
                      onDelete!();
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
