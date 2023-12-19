import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/store/product.dart';
import '../../../../data/repository/product/products_repo.dart';
import '../components/index.dart';
import '../controllers/product_details_controller.dart';

@RoutePage()
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView(this.productId, {super.key});
  final String productId;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(productsRepo: ProductsRepo(), productId: productId),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Product Details'),
              actions: [
                controller.obx(
                    (product) => AdaptiveButton(
                          onPressed: () async {
                            await showOkCancelAlertDialog(
                              context: context,
                              title: product.status == ProductStatus.published
                                  ? 'Unpublish product?'
                                  : 'Publish product?',
                              message:
                                  'Are you sure you want to ${product.status == ProductStatus.published ? 'unpublish' : 'publish'} this product?',
                              isDestructiveAction: true,
                            ).then((result) async {
                              if (result == OkCancelResult.ok) {
                                await controller.publishProduct(product);
                              }
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _getStatusIcon(product!.status),
                              const SizedBox(width: 4.0),
                              Text(
                                product.status.name.capitalize ??
                                    product.status.name,
                                style: context.bodySmall,
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
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
                            await _scrollToSelectedContent(
                                expansionTileKey: controller.variantsKey,
                                context: context,
                                scrollController: controller.scrollController);
                          }
                        },
                      ),
                      space,
                      ProductDetailsAttributes(
                        product: product,
                        expansionKey: controller.attributesKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await _scrollToSelectedContent(
                                expansionTileKey: controller.attributesKey,
                                context: context,
                                scrollController: controller.scrollController);
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
                            await _scrollToSelectedContent(
                                expansionTileKey: controller.thumbnailKey,
                                context: context,
                                scrollController: controller.scrollController);
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
                            await _scrollToSelectedContent(
                                expansionTileKey: controller.imagesKey,
                                context: context,
                                scrollController: controller.scrollController);
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
                    AdaptiveFilledButton(
                        child: const Text('Retry'),
                        onPressed: () async => await controller.fetchProduct()),
                  ],
                )),
                onLoading: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          );
        });
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

  Future<void> _scrollToSelectedContent(
      {required GlobalKey expansionTileKey,
      required BuildContext context,
      required ScrollController scrollController}) async {
    await Future.delayed(const Duration(milliseconds: 240)).then((value) async {
      final box =
          expansionTileKey.currentContext?.findRenderObject() as RenderBox?;
      final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0;
      final scrollPoint = scrollController.offset +
          yPosition -
          context.mediaQuery.padding.top -
          56;
      if (scrollPoint <= scrollController.position.maxScrollExtent) {
        await scrollController.animateTo(scrollPoint - 10,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn);
      } else {
        await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn);
      }
    });
  }
}
