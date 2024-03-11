import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:image_picker/image_picker.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/product_extension.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/data/helper/image_picker_helper.dart';
import 'package:medusa_admin/data/models/wrapped.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'image_card.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

import 'product_media.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class ProductThumbnail extends StatefulWidget {
  const ProductThumbnail(
      {super.key,
      this.onThumbnailChange,
      this.controller,
      required this.updateMode,
      this.thumbnail,
      this.product,
      this.onChanged});
  final void Function(File file)? onThumbnailChange;
  final FlexExpansionTileController? controller;
  final bool updateMode;
  final File? thumbnail;
  final Product? product;
  final void Function(File? file)? onChanged;
  @override
  State<ProductThumbnail> createState() => _ProductThumbnailState();
}

class _ProductThumbnailState extends State<ProductThumbnail> {
  File? thumbnail;
  Product? product;
  bool get updateMode => widget.updateMode;
  ImagePickerHelper imagePickerHelper = ImagePickerHelper.instance;
  final key = GlobalKey();
  @override
  void initState() {
    thumbnail = widget.thumbnail;
    product = widget.product;
    super.initState();
  }

  Widget getThumbnail() {
    if (updateMode) {
      if (product?.thumbnail != null && thumbnail == null) {
        return NetworkImageCard(
          product!.thumbnail!,
          heroTag: 'thumbnail',
          onDelete: () {
            product = product?.copyWith(thumbnail: const Wrapped.value(null));
            // controller.deleteThumbnail = true;
            widget.onChanged?.call(thumbnail);
            setState(() {});
          },
          deleteIconColor: Colors.red,
        );
      } else if (thumbnail != null) {
        return Column(
          children: [
            const Gap(12),
            ImageCard(
              thumbnail!,
              onCrop: () {
                imagePickerHelper.cropImage(thumbnail!).then((result) {
                  if (result == null) return;
                  setState(() => thumbnail = result);
                  widget.onChanged?.call(thumbnail);
                });
              },
              onRename: () async {
                final result = await showBarModalBottomSheet(
                    context: context,
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                    builder: (context) {
                      return RenameFileView(thumbnail!);
                    });

                if (result is File) {
                  setState(() => thumbnail = result);
                  widget.onChanged?.call(thumbnail);
                }
              },
              onDelete: () async {
                final path = thumbnail!.path;
                thumbnail = null;
                setState(() {});
                widget.onChanged?.call(thumbnail);
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
      if (thumbnail != null) {
        return Column(
          children: [
            const Gap(12),
            ImageCard(thumbnail!),
          ],
        );
      }
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return FlexExpansionTile(
      key: key,
      controller: widget.controller,
      title: const Text('Thumbnail'),
      onExpansionChanged: (expanded) async {
        if (expanded) {
          await key.currentContext.ensureVisibility();
        }
      },
      child: Column(
        children: [
          Text(
              'Used to represent your product during checkout, social sharing and more.',
              style: smallTextStyle?.copyWith(color: manatee)),
          getThumbnail(),
          TextButton(
              onPressed: () async {
                ImageSource? imageSource = ImageSource.gallery;
                imageSource = await showModalActionSheet<ImageSource>(
                    context: context,
                    title: 'Image Source',
                    actions: ImageSource.values
                        .map((e) => SheetAction<ImageSource>(
                              key: e,
                              label: e.name.capitalize,
                            ))
                        .toList());
                if (imageSource == null) {
                  return;
                }
                try {
                  final pickedImage =
                      await imagePickerHelper.imagePicker(source: imageSource);
                  if (pickedImage != null) {
                    thumbnail = pickedImage;
                    setState(() {});
                    widget.onChanged?.call(thumbnail);
                  }
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Text('Pick image')),
        ],
      ),
    );
  }
}
