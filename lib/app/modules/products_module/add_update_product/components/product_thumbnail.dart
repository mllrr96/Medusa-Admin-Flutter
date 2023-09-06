import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../controllers/add_update_product_controller.dart';
import 'image_card.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({super.key, this.onExpansionChanged});
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return GetBuilder<AddUpdateProductController>(
      id: 4,
      builder: (controller) {
        return CustomExpansionTile(
          controller: controller.thumbnailTileCtrl,
          label: 'Thumbnail',
          onExpansionChanged: onExpansionChanged,
          children: [
            Text('Used to represent your product during checkout, social sharing and more.',
                style: smallTextStyle?.copyWith(color: lightWhite)),
            if (!controller.updateMode && controller.product.thumbnail != null)
              CachedNetworkImage(imageUrl: controller.product.thumbnail!),
            if (!controller.updateMode && controller.thumbnailImage != null)
              Column(
                children: [
                  space,
                  ImageCard(controller.thumbnailImage!),
                ],
              ),
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
                  final pickedImage = await controller.imagePickerHelper.imagePicker(source: imageSource);
                  if (pickedImage != null) {
                    controller.thumbnailImage = pickedImage;
                    controller.update([4]);
                  }
                },
                child: const Text('Pick image')),
          ],
        );
      },
    );
  }
}
