import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../data/repository/collection/collection_repo.dart';
import '../../../../data/repository/product/products_repo.dart';
import '../../../../data/repository/product_type/product_type_repo.dart';
import '../../../../data/repository/sales_channel/sales_channel_repo.dart';
import '../../../../data/repository/upload/upload_repo.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_close_button.dart';
import '../components/index.dart';
import '../controllers/add_update_product_controller.dart';

@RoutePage()
class AddUpdateProductView extends StatelessWidget {
  const AddUpdateProductView( {super.key,this.updateProductReq});
  final UpdateProductReq? updateProductReq;
  @override
  Widget build(BuildContext context) {
    Future<void> scrollToSelectedContent(
        {required GlobalKey globalKey,
        Duration? delay,
        required ScrollController scrollController}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then(
        (value) async {
          final yPosition =
              (globalKey.currentContext?.findRenderObject() as RenderBox?)
                      ?.localToGlobal(Offset.zero)
                      .dy ??
                  0.0;
          var topPadding = context.mediaQueryPadding.top + kToolbarHeight;
          final scrollPoint = scrollController.offset + yPosition - topPadding;
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
        },
      );
    }

    // You can not be a good person until you know how much
    // evil you contain within you

    const space = Gap(12);
    return GetBuilder<AddUpdateProductController>(
      init: AddUpdateProductController(
          productsRepo: ProductsRepo(),
          productTypeRepo: ProductTypeRepo(),
          collectionRepo: CollectionRepo(),
          uploadRepo: UploadRepo(),
          salesChannelRepo: SalesChannelRepo(),
          updateProductReq: updateProductReq),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            try {
              final images = List<File>.from(controller.images);
              controller.images.clear();
              if (images.isNotEmpty) {
                for (var file in controller.images) {
                  await file.delete();
                }
              }
              final thumbnail = controller.thumbnailImage;
              controller.thumbnailImage = null;
              if (thumbnail != null) {
                await thumbnail.delete();
              }
            } catch (e) {
              debugPrint(e.toString());
            }
            return true;
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                leading: const AdaptiveCloseButton(),
                title: controller.updateMode
                    ? const Text('Update Product')
                    : const Text('New Product'),
                centerTitle: true,
                actions: [
                  AdaptiveButton(
                      onPressed: () async => controller.updateMode
                          ? await controller.updateProduct(context)
                          : await controller.addProduct(context),
                      child: controller.updateMode
                          ? const Text('Save')
                          : const Text('Publish')),
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    child: Column(
                      children: [
                        ProductGeneralInformation(
                          key: controller.generalKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await scrollToSelectedContent(
                                  globalKey: controller.generalKey,
                                  scrollController:
                                      controller.scrollController);
                            }
                          },
                        ),
                        space,
                        ProductOrganize(
                          key: controller.organizeKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await scrollToSelectedContent(
                                  globalKey: controller.organizeKey,
                                  scrollController:
                                      controller.scrollController);
                            }
                          },
                        ),
                        space,
                        ProductVariants(
                          key: controller.variantKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await scrollToSelectedContent(
                                  globalKey: controller.variantKey,
                                  scrollController:
                                      controller.scrollController);
                            }
                          },
                        ),
                        space,
                        ProductAttributes(
                          key: controller.attributesKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await scrollToSelectedContent(
                                  globalKey: controller.attributesKey,
                                  scrollController:
                                      controller.scrollController);
                            }
                          },
                        ),
                        space,
                        ProductThumbnail(
                          key: controller.thumbnailKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await scrollToSelectedContent(
                                  globalKey: controller.thumbnailKey,
                                  scrollController:
                                      controller.scrollController);
                            }
                          },
                        ),
                        space,
                        ProductMedia(
                          key: controller.mediaKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await scrollToSelectedContent(
                                  globalKey: controller.mediaKey,
                                  scrollController:
                                      controller.scrollController);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
