import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/update_product_use_case.dart';

import '../components/index.dart';
import '../controllers/add_update_product_controller.dart';

@RoutePage()
class AddUpdateProductView extends StatelessWidget {
  const AddUpdateProductView({super.key, this.updateProductReq});
  final UpdateProductReq? updateProductReq;
  @override
  Widget build(BuildContext context) {
    // You can not be a good person until you know how much
    // evil you contain within you

    const space = Gap(12);
    return GetBuilder<AddUpdateProductController>(
      init: AddUpdateProductController(
          updateProductUseCase: UpdateProductUseCase.instance,
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
                leading: const CloseButton(),
                title: controller.updateMode
                    ? const Text('Update Product')
                    : const Text('New Product'),
                actions: [
                  TextButton(
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
                              await controller.generalKey.currentContext
                                  .ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductOrganize(
                          key: controller.organizeKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.organizeKey.currentContext
                                  .ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductVariants(
                          key: controller.variantKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.variantKey.currentContext
                                  .ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductAttributes(
                          key: controller.attributesKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.attributesKey.currentContext
                                  .ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductThumbnail(
                          key: controller.thumbnailKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.thumbnailKey.currentContext
                                  .ensureVisibility();
                            }
                          },
                        ),
                        space,
                        ProductMedia(
                          key: controller.mediaKey,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await controller.mediaKey.currentContext
                                  .ensureVisibility();
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
