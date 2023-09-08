import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/components/image_card.dart';
import 'package:medusa_admin/app/modules/products_module/product_details/controllers/product_details_controller.dart';

import '../../../../routes/app_pages.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../add_update_product/controllers/add_update_product_controller.dart';

class ProductDetailsThumbnail extends GetView<ProductDetailsController> {
  const ProductDetailsThumbnail({Key? key, required this.product, this.onExpansionChanged, this.expansionKey})
      : super(key: key);
  final Product product;
  final void Function(bool)? onExpansionChanged;
  final Key? expansionKey;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);
    final buttonText = product.thumbnail == null ? 'Add':'Edit';
    return CustomExpansionTile(
      key: expansionKey,
      maintainState: true,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Thumbnail', style: Theme.of(context).textTheme.bodyLarge),
      trailing: GetPlatform.isAndroid
          ? TextButton(
              onPressed: () async {
                await Get.toNamed(Routes.ADD_UPDATE_PRODUCT, arguments: UpdateProductReq(product: product, number: 4))
                    ?.then((result) async {
                  if (result != null) {
                    await controller.fetchProduct();
                  }
                });
              },
              child: Text(buttonText))
          : CupertinoButton(
              onPressed: () async {
                await Get.toNamed(Routes.ADD_UPDATE_PRODUCT, arguments: UpdateProductReq(product: product, number: 4))
                    ?.then((result) async {
                  if (result != null) {
                    await controller.fetchProduct();
                  }
                });
              },
              padding: EdgeInsets.zero,
              child: Text(buttonText)),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        if (product.thumbnail != null)
          GestureDetector(
              onTap: () => Get.to(() => ImageViewScreen(imageUrl: product.thumbnail!, heroTag: 'thumbnail',)),
              child: SizedBox(height: 120, child: Hero(
                  tag: 'thumbnail',
                  child: CachedNetworkImage(imageUrl: product.thumbnail!)))),
        if (product.thumbnail == null)
          Text('No thumbnail added', style: smallTextStyle?.copyWith(color: lightWhite)),
        space,
      ],
    );
  }
}
