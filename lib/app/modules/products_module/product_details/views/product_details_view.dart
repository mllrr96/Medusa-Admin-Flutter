import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';

import '../../../../data/models/store/product.dart';
import '../components/product_details_components.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Product Details'),
        centerTitle: true,
        actions: [
          controller.obx(
              (product) => AdaptiveButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _getStatusIcon(product!.status),
                        const SizedBox(width: 4.0),
                        Text(
                          product.status.name.capitalize ?? product.status.name,
                          style: smallTextStyle,
                        ),
                      ],
                    ),
                  ),
              onLoading: const SizedBox.shrink(),
              onError: (e) => const SizedBox.shrink()),
        ],
      ),
      body: SafeArea(
        child: controller.obx(
          (product) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            controller: controller.scrollController,
            child: Column(
              children: [
                ProductDetailsOverview(product: product!),
                space,
                ProductDetailsVariants(
                  product: product,
                  expansionKey: controller.variantsKey,
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await _scrollToSelectedContent(expansionTileKey: controller.variantsKey, context: context);
                    }
                  },
                ),
                space,
                ProductDetailsAttributes(
                  product: product,
                  expansionKey: controller.attributesKey,
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await _scrollToSelectedContent(expansionTileKey: controller.attributesKey, context: context);
                    }
                  },
                  // onExpansionChanged: onExChanged,
                ),
                space,
                ProductDetailsThumbnail(
                  product: product,
                  expansionKey: controller.thumbnailKey,
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await _scrollToSelectedContent(expansionTileKey: controller.thumbnailKey, context: context);
                    }
                  },
                  // onExpansionChanged: onExChanged,
                ),
                space,
                ProductDetailsImages(
                  product: product,
                  expansionKey: controller.imagesKey,
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await _scrollToSelectedContent(expansionTileKey: controller.imagesKey, context: context);
                    }
                  },
                ),
              ],
            ),
          ),
          onError: (e) => Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Error loading product'),
              AdaptiveFilledButton(child: const Text('Retry'), onPressed: () async => await controller.loadProduct()),
            ],
          )),
          onLoading: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
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

  Future<void> _scrollToSelectedContent({required GlobalKey expansionTileKey, required BuildContext context}) async {
    await Future.delayed(const Duration(milliseconds: 240)).then((value) async {
      final box = expansionTileKey.currentContext?.findRenderObject() as RenderBox?;
      final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0;
      final scrollPoint = controller.scrollController.offset + yPosition - context.mediaQuery.padding.top - 56;
      if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
        await controller.scrollController
            .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      } else {
        await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      }
    });
  }
}
