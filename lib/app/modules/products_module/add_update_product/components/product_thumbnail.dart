import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/components/product_media.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../components/adaptive_button.dart';
import '../controllers/add_update_product_controller.dart';
import 'image_card.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({super.key, this.onExpansionChanged});
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);

    Widget getThumbnail(AddUpdateProductController controller) {
      final updateMode = controller.updateMode;

      if (updateMode) {
        if (controller.product.thumbnail != null && controller.thumbnailImage == null) {
          return NetworkImageCard(
            controller.product.thumbnail!,
            heroTag: 'thumbnail',
            onDelete: () {
              controller.product = controller.product.copyWith.thumbnail(null);
              controller.deleteThumbnail = true;
              controller.update([4]);
            },
            deleteIconColor: Colors.red,
          );
        } else if (controller.thumbnailImage != null) {
          return Column(
            children: [
              space,
              ImageCard(
                controller.thumbnailImage!,
                onCrop: () {
                  controller.imagePickerHelper.cropImage(controller.thumbnailImage!).then((result) {
                    if (result == null) return;
                    controller.thumbnailImage = result;
                    controller.update([4]);
                  });
                },
                onRename: () async {
                  final result = await showBarModalBottomSheet(
                      context: context,
                      overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                      builder: (context) {
                        return RenameFileView(controller.thumbnailImage!);
                      });

                  if (result is File) {
                    controller.thumbnailImage = result;
                    controller.update([4]);
                  }
                },
                onDelete: () async {
                  final path = controller.thumbnailImage!.path;
                  controller.thumbnailImage = null;
                  controller.update([4]);
                  try {
                    await File(path).delete();
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
              ),
            ],
          );
        }
      } else {
        if (controller.thumbnailImage != null) {
          return Column(
            children: [
              space,
              ImageCard(controller.thumbnailImage!),
            ],
          );
        }
      }

      return const SizedBox.shrink();
    }

    return GetBuilder<AddUpdateProductController>(
      id: 4,
      builder: (controller) {
        return HeaderCard(
          controller: controller.thumbnailTileCtrl,
          title: const Text('Thumbnail'),
          onExpansionChanged: onExpansionChanged,
          child: Column(
            children: [
              Text('Used to represent your product during checkout, social sharing and more.',
                  style: smallTextStyle?.copyWith(color: lightWhite)),
              getThumbnail(controller),
              AdaptiveButton(
                  onPressed: () async {
                    ImageSource? imageSource = ImageSource.gallery;
                    imageSource = await showModalActionSheet<ImageSource>(
                        context: context,
                        title: 'Image Source',
                        actions: ImageSource.values
                            .map((e) => SheetAction<ImageSource>(
                          key: e,
                          label: e.name.capitalize ?? e.name,
                        ))
                            .toList());
                    if (imageSource == null) {
                      return;
                    }
                    try {
                      final pickedImage = await controller.imagePickerHelper.imagePicker(source: imageSource);
                      if (pickedImage != null) {
                        controller.thumbnailImage = pickedImage;
                        controller.update([4]);
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: const Text('Pick image')),
            ],
          ),
        );
      },
    );
  }
}
