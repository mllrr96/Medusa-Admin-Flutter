import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class ProductVariantListTile extends StatelessWidget {
  const ProductVariantListTile(
      {super.key, required this.productVariant, this.value, this.onChanged, required this.index});
  final ProductVariant productVariant;
  final bool? value;
  final void Function(bool?)? onChanged;
  final int index;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    Widget getStatusIcon() {
      switch (productVariant.product!.status) {
        case ProductStatus.draft:
          return const Icon(Icons.circle, color: Colors.grey, size: 12);
        case ProductStatus.proposed:
          return const Icon(Icons.circle, color: Colors.amber, size: 12);

        case ProductStatus.published:
          return const Icon(Icons.circle, color: Colors.green, size: 12);

        case ProductStatus.rejected:
          return const Icon(Icons.circle, color: Colors.red, size: 12);
      }
    }

    return CheckboxListTile(
      // isThreeLine: true,
      title: Text(productVariant.product?.title ?? ''),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  getStatusIcon(),
                  const SizedBox(width: 4.0),
                  Text(productVariant.title ?? '', style: smallTextStyle),
                ],
              ),
              Text(
                productVariant.inventoryQuantity?.toString() ?? '',
                style: smallTextStyle,
              )
            ],
          ),
        ],
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: productVariant.product?.thumbnail != null
          ? SizedBox(
              width: 45,
              child: CachedNetworkImage(
                key: ValueKey(productVariant.product!.thumbnail!),
                imageUrl: productVariant.product!.thumbnail!,
                placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, string, error) => const Icon(Icons.warning_rounded, color: Colors.redAccent),
              ))
          : null,
      value: value,
      onChanged: onChanged,
    );
  }
}
