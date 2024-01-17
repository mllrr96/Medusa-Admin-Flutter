import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';

class PriceListProductTile extends StatelessWidget {
  const PriceListProductTile(this.product,
      {super.key, this.onEditPricesTap, this.onRemoveProductTap});
  final Product product;
  final void Function()? onEditPricesTap;
  final void Function()? onRemoveProductTap;

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    return ListTile(
      onTap: () async {
        await showModalActionSheet<int>(
            context: context,
            actions: <SheetAction<int>>[
              const SheetAction(label: 'Edit prices', key: 0),
              const SheetAction(
                  label: 'Remove product', isDestructiveAction: true, key: 1),
            ]).then((result) async {
          switch (result) {
            case 0:
              onEditPricesTap?.call();
              return;
            case 1:
              final confirmDelete = await showOkCancelAlertDialog(
                context: context,
                title: 'Remove product',
                message: 'Are you sure you want to remove this product?',
                okLabel: 'Yes, remove',
                isDestructiveAction: true,
              );
              if (confirmDelete == OkCancelResult.ok) {
                onRemoveProductTap?.call();
              }
              return;
          }
        });
      },
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
          : null,
      title: Text(product.title ?? ''),
      subtitle: product.collection != null
          ? Text('${product.collection!.title} collection',
              style: smallTextStyle?.copyWith(color: manatee))
          : null,
      trailing: Text('Variants: ${product.variants?.length ?? 'N/A'}',
          style: mediumTextStyle),
    );
  }
}
