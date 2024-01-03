import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/products_module/product_details/controllers/product_details_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';

import '../../add_update_product/controllers/add_update_product_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductDetailsImages extends GetView<ProductDetailsController> {
  const ProductDetailsImages(
      {super.key,
      required this.product,
      this.onExpansionChanged,
      this.expansionKey});
  final Product product;
  final void Function(bool)? onExpansionChanged;
  final Key? expansionKey;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final buttonText =
        product.images == null || (product.images?.isEmpty ?? false)
            ? 'Add'
            : 'Edit';
    return FlexExpansionTile(
      key: expansionKey,
      maintainState: true,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Images', style: Theme.of(context).textTheme.bodyLarge),
      trailing: TextButton(
          onPressed: () async {
            await context
                .pushRoute(AddUpdateProductRoute(
                    updateProductReq:
                        UpdateProductReq(product: product, number: 5)))
                .then((result) async {
              if (result != null) {
                await controller.fetchProduct();
              }
            });
          },
          child: Text(buttonText)),
      childPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        children: [
          if (product.images != null)
            Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: product.images!
                    .map((e) => SizedBox(
                        height: 120,
                        width: 90,
                        child: GestureDetector(
                            onTap: () => context
                                .pushRoute(ImagePreviewRoute(imageUrl: e.url)),
                            child: Hero(
                                tag: e.url!,
                                child: CachedNetworkImage(imageUrl: e.url!)))))
                    .toList()),
          if (product.images == null || (product.images?.isEmpty ?? false))
            Text('No images added',
                style: smallTextStyle?.copyWith(color: lightWhite)),
          space,
        ],
      ),
    );
  }
}
