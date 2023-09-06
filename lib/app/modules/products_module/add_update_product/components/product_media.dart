import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../controllers/add_update_product_controller.dart';
import 'image_card.dart';

class ProductMedia extends StatelessWidget {
  const ProductMedia({super.key, this.onExpansionChanged});
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return GetBuilder<AddUpdateProductController>(
      id: 5,
      builder: (controller) {
        return CustomExpansionTile(
          controller: controller.mediaTileCtrl,
          label: 'Media',
          onExpansionChanged: onExpansionChanged,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add images to your product.', style: smallTextStyle?.copyWith(color: lightWhite)),
            space,
            if (controller.images.isNotEmpty)
              ListView.separated(
                  separatorBuilder: (_, __) => space,
                  itemCount: controller.images.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final image = controller.images[index];
                    return ImageCard(
                      image,
                      onDelete: () {
                        try {
                          controller.images[index].delete();
                          controller.images.removeAt(index);
                          controller.update([5]);
                        } catch (e) {
                          CherryToast.error(
                            title: const Text('Error deleting image'),
                            action: Text(e.toString()),
                          );
                        }
                      },
                      onCrop: () async {
                        final result = await controller.imagePickerHelper.cropImage(image);
                        if (result != null) {
                          try {
                            controller.images[index].delete();
                            controller.images[index] = result;
                            controller.update([5]);
                          } catch (e) {
                            CherryToast.error(
                              title: const Text('Error cropping image'),
                              action: Text(e.toString()),
                            );
                          }
                        }
                      },
                    );
                  }),
            Center(
              child: AdaptiveButton(
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
                    switch (imageSource) {
                      case ImageSource.camera:
                        await controller.imagePickerHelper.imagePicker(source: imageSource).then((result) {
                          if (result == null) {
                            return;
                          }
                          controller.images.add(result);
                        });
                      case ImageSource.gallery:
                        await controller.imagePickerHelper.multipleImagePicker().then((result) {
                          if (result.isEmpty) {
                            return;
                          }
                          controller.images.addAll(result);
                          controller.update([5]);
                          controller.mediaTileCtrl.expand();
                        });
                    }
                  },
                  child: const Text('Pick images')),
            )
          ],
        );
      },
    );
  }
}
