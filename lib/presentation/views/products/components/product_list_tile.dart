import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile(
      {super.key,
      required this.product,
      this.onTap,
      this.onDelete,
      this.onPublish,
      this.onEdit,
      this.onDuplicate});
  final Product product;
  final void Function()? onTap;
  final void Function()? onDelete;
  final void Function()? onPublish;
  final void Function()? onEdit;
  final void Function()? onDuplicate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16.0),
      onTap: onTap ??
          () async => await context
              .pushRoute(ProductDetailsRoute(productId: product.id!)),
      title: Text(product.title!, style: context.bodyMedium),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getStatusIcon(product.status),
          const SizedBox(width: 4.0),
          Text(product.status.name.capitalize, style: context.bodySmall),
        ],
      ),
      leading: product.thumbnail != null
          ? SizedBox(
              width: 45,
              child: CachedNetworkImage(
                key: ValueKey(product.thumbnail),
                imageUrl: product.thumbnail!,
                placeholder: (context, text) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, string, error) =>
                    const Icon(Icons.warning_rounded, color: Colors.redAccent),
              ))
          : Container(
              width: 45,
              height: double.maxFinite,
              color: ColorManager.manatee,
              child: const Icon(Icons.image_not_supported),
            ),
      trailing: IconButton(
        padding: const EdgeInsets.all(16.0),
        onPressed: () async {
          await showModalActionSheet<int>(
              title: 'Manage Product',
              message: product.title ?? '',
              context: context,
              actions: <SheetAction<int>>[
                const SheetAction(label: 'Edit', key: 0),
                SheetAction(
                    label: product.status == ProductStatus.published
                        ? 'Unpublish'
                        : 'Publish',
                    key: 1),
                const SheetAction(label: 'Duplicate', key: 2),
                const SheetAction(
                    label: 'Delete', isDestructiveAction: true, key: 3),
              ]).then((result) async {
            switch (result) {
              case 0:
                onEdit?.call();
              case 1:
                onPublish?.call();
              case 2:
                onDuplicate?.call();
                break;
              case 3:
                onDelete?.call();
            }
          });
        },
        icon: const Icon(Icons.more_horiz),
      ),
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
