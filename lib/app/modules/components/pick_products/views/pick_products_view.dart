import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import '../../../../data/models/store/product.dart';
import '../controllers/pick_products_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class PickProductsView extends GetView<PickProductsController> {
  const PickProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickProductsController>(
      builder: (controller) {
        final smallTextStyle = Theme.of(context).textTheme.titleSmall;
        final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;

        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveCloseButton(),
            title: const Text('Products'),
            actions: [
              AdaptiveButton(
                  onPressed: controller.selectedProducts
                          .map((e) => e.id!)
                          .toList()
                          .listEquals(controller.pickProductsReq.selectedProducts?.map((e) => e.id!).toList() ?? [])
                      ? null
                      : () {
                          controller.save();
                        },
                  child: const Text('Save'))
            ],
          ),
          body: SafeArea(
              child: PagedListView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, product, index) {
                  final enabled = controller.pickProductsReq.disabledProducts != null
                      ? !controller.pickProductsReq.disabledProducts!.map((e) => e.id).toList().contains(product.id)
                      : true;
                  return CheckboxListTile(
                    enabled: enabled,
                    title: Text(product.title!),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (controller.pickProductsReq.includeVariantCount)
                          Text('Variants: ${product.variants?.length ?? '0'}',
                              style: smallTextStyle?.copyWith(color: enabled ? null : lightWhite)),
                        _getStatusIcon(product.status),
                      ],
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    secondary: product.thumbnail != null
                        ? SizedBox(
                            width: 45,
                            child: CachedNetworkImage(
                              key: ValueKey(product.thumbnail!),
                              imageUrl: product.thumbnail!,
                              placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                              errorWidget: (context, string, error) =>
                                  const Icon(Icons.warning_rounded, color: Colors.redAccent),
                            ))
                        : null,
                    value: controller.selectedProducts.map((e) => e.id).toList().contains(product.id),
                    selected:
                        controller.pickProductsReq.selectedProducts?.map((e) => e.id!).toList().contains(product.id) ??
                            false,
                    onChanged: (value) {
                      if (value != null && value) {
                        controller.selectedProducts.add(product);
                      } else if (value != null && !value) {
                        controller.selectedProducts.removeWhere((e) => e.id == product.id);
                      }
                      controller.update();
                    },
                  );
                },
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
          )),
        );
      },
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
