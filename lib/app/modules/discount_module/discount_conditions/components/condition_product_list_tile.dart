import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class ProductListTileWithVariantCount extends StatelessWidget {
  const ProductListTileWithVariantCount(
      {super.key, required this.product, required this.value, this.onChanged, this.enabled});
  final Product product;
  final bool value;
  final bool? enabled;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    return CheckboxListTile(

      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: product.thumbnail != null
          ? SizedBox(
              width: 45,
              child: CachedNetworkImage(
                key: ValueKey(product.thumbnail),
                imageUrl: product.thumbnail!,
                placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, string, error) => const Icon(Icons.warning_rounded, color: Colors.redAccent),
              ))
          : null,
      title: Text(product.title ?? '',
          style: mediumTextStyle?.copyWith(color: enabled != null && enabled == false ? manatee : null)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Variants: ${product.variants?.length ?? '0'}',
              style: smallTextStyle?.copyWith(color: enabled != null && enabled == false ? manatee : null)),
          _getStatusIcon(product.status),
        ],
      ),
      value: value,
      onChanged: onChanged,
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
