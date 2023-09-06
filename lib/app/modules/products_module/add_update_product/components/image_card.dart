import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/adaptive_icon.dart';
import '../views/add_update_product_view.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      this.image, {
        super.key,
        this.onDelete,
        this.onCrop,
      });
  final File image;
  final void Function()? onDelete;
  final void Function()? onCrop;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      onTap: () => Get.to(() => ImageViewScreen(imageFile: image)),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: context.theme.scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: image.path,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 120),
                child: Image.file(
                  image,
                  width: 100,
                ),
              ),
            ),
            AdaptiveIcon(
                onPressed: () async {
                  await showModalActionSheet<int>(context: context, title: 'Image Options', actions: [
                    const SheetAction<int>(
                      key: 1,
                      label: 'Crop',
                      icon: Icons.crop,
                    ),
                    const SheetAction<int>(
                      key: 0,
                      label: 'Delete',
                      icon: Icons.delete_forever,
                      isDestructiveAction: true,
                    ),
                  ]).then((result) {
                    switch (result) {
                      case 0:
                        if (onDelete != null) {
                          onDelete!();
                        }
                      case 1:
                        if (onCrop != null) {
                          onCrop!();
                        }
                    }
                  });
                },
                icon: const Icon(Icons.more_horiz)),
          ],
        ),
      ),
    );
  }
}
class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key, this.imageFile, this.imageUrl});

  final File? imageFile;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget() {
      if (imageFile != null) {
        return Image.file(imageFile!);
      } else if (imageUrl != null) {
        return CachedNetworkImage(imageUrl: imageUrl!);
      } else {
        return const SizedBox.shrink();
      }
    }

    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: imageFile?.path ?? imageUrl ?? '',
            child: imageWidget(),
          ),
        ),
      ),
    );
  }
}
