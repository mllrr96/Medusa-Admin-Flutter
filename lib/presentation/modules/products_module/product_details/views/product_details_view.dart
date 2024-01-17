import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/product_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

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
        init: ProductDetailsController(
            productDetailsUseCase: ProductDetailsUseCase.instance, productId: productId),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product Details'),
              actions: [
                controller.obx(
                    (product) => TextButton(
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
                            await controller.variantsKey.currentContext
                                .ensureVisibility();
                          }
                        },
                      ),
                      space,
                      ProductDetailsAttributes(
                        product: product,
                        expansionKey: controller.attributesKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await controller.attributesKey.currentContext
                                .ensureVisibility();
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
                            await controller.thumbnailKey.currentContext
                                .ensureVisibility();
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
                            await controller.imagesKey.currentContext
                                .ensureVisibility();
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
                    FilledButton(
                        child: const Text('Retry'),
                        onPressed: () async => await controller.fetchProduct()),
                  ],
                )),
                onLoading: const ProductDetailsLoadingPage(),
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
}
