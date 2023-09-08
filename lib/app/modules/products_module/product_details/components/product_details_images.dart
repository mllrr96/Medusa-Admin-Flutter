import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/components/image_card.dart';
import 'package:medusa_admin/app/modules/products_module/product_details/controllers/product_details_controller.dart';

import '../../../../routes/app_pages.dart';
import '../../add_update_product/controllers/add_update_product_controller.dart';

class ProductDetailsImages extends GetView<ProductDetailsController> {
  const ProductDetailsImages({Key? key, required this.product, this.onExpansionChanged, this.expansionKey})
      : super(key: key);
  final Product product;
  final void Function(bool)? onExpansionChanged;
  final Key? expansionKey;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final buttonText = product.images == null || (product.images?.isEmpty ?? false) ? 'Add':'Edit';
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: ExpansionTile(
          key: expansionKey,
          maintainState: true,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('Images', style: Theme.of(context).textTheme.bodyLarge),
          trailing: GetPlatform.isAndroid
              ? TextButton(
                  onPressed: () async {
                    await Get.toNamed(Routes.ADD_UPDATE_PRODUCT,
                            arguments: UpdateProductReq(product: product, number: 5))
                        ?.then((result) async {
                      if (result != null) {
                        await controller.fetchProduct();
                      }
                    });
                  },
                  child: Text(buttonText))
              : CupertinoButton(
                  onPressed: () async {
                    await Get.toNamed(Routes.ADD_UPDATE_PRODUCT,
                            arguments: UpdateProductReq(product: product, number: 5))
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
            // TODO: show images when tapped on, use easy_image_viewer package
            if (product.images != null)
              Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: product.images!
                      .map((e) => SizedBox(
                          height: 120,
                          width: 90,
                          child: Hero(
                              tag: e.url!,
                              child: GestureDetector(
                                  onTap: () => Get.to(() => ImageViewScreen(imageUrl: e.url)),
                                  child: CachedNetworkImage(imageUrl: e.url!)))))
                      .toList()),
            if (product.images == null || (product.images?.isEmpty ?? false))
            Text('No images added', style: smallTextStyle?.copyWith(color: lightWhite)),

            space,
          ],
        ),
      ),
    );
  }
}
