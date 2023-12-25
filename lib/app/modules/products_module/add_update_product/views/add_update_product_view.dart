import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/extension.dart';
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
            onTap: () => context.unfocus(),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    child: Column(
                      children: [
                        ProductGeneralInformation(
                          key: controller.generalKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await  controller.generalKey.currentContext.ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductOrganize(
                          key: controller.organizeKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.organizeKey.currentContext.ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductVariants(
                          key: controller.variantKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.variantKey.currentContext.ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductAttributes(
                          key: controller.attributesKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.attributesKey.currentContext.ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductThumbnail(
                          key: controller.thumbnailKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.thumbnailKey.currentContext.ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductMedia(
                          key: controller.mediaKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.mediaKey.currentContext.ensureVisibility();
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
