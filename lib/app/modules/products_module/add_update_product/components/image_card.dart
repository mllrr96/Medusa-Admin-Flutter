import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../../../components/adaptive_icon.dart';

class NetworkImageCard extends StatelessWidget {
  const NetworkImageCard(
    this.imageUrl, {
    super.key,
    this.onDelete,
    this.deleteIconColor,
    this.heroTag,
  });
  final String imageUrl;
  final void Function()? onDelete;
  final Color? deleteIconColor;
  final Object? heroTag;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      onTap: () => context.pushRoute(ImagePreviewRoute(
        imageUrl: imageUrl,
        heroTag: heroTag,
      )),
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
              tag: heroTag ?? imageUrl,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 120),
                child: CachedNetworkImage(imageUrl: imageUrl),
              ),
            ),
            AdaptiveIcon(
                onPressed: onDelete,
                icon: Icon(Icons.delete_forever, color: deleteIconColor)),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard(
    this.image, {
    super.key,
    this.onDelete,
    this.onCrop,
    this.onRename,
  });
  final File image;
  final void Function()? onDelete;
  final void Function()? onCrop;
  final void Function()? onRename;
  @override
  Widget build(BuildContext context) {
    final fileSize = (image.readAsBytesSync().lengthInBytes) / 1000000;
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      onTap: () => context.pushRoute(ImagePreviewRoute(imageFile: image)),
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
            Flexible(
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 120),
                    child: Image.file(
                      image,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          image.path.split(Platform.pathSeparator).last,
                          style: smallTextStyle?.copyWith(
                              color: lightWhite, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          '${fileSize.toStringAsFixed(2)} MB',
                          style: smallTextStyle?.copyWith(
                              color: fileSize > 10 ? Colors.red : lightWhite,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AdaptiveIcon(
                onPressed: () async {
                  await showModalActionSheet<int>(
                      context: context,
                      title: 'Image Options',
                      actions: [
                        const SheetAction<int>(
                          key: 1,
                          label: 'Crop',
                          icon: Icons.crop,
                        ),
                        const SheetAction<int>(
                          key: 2,
                          label: 'Rename',
                          icon: Icons.drive_file_rename_outline,
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
                      case 2:
                        if (onRename != null) {
                          onRename!();
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

@RoutePage()
class ImagePreviewView extends StatelessWidget {
  const ImagePreviewView(
      {super.key,
      this.imageFile,
      this.imageUrl,
      this.heroTag,
      this.disableHero = false})
      : assert(imageFile != null || imageUrl != null);

  final File? imageFile;
  final String? imageUrl;
  final Object? heroTag;
  final bool disableHero;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = imageFile != null
        ? Image.file(imageFile!)
        : CachedNetworkImage(imageUrl: imageUrl!);

    return GestureDetector(
      onTap: () {
        context.popRoute();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
        ),
        body: Center(
          child: disableHero
              ? imageWidget
              : Hero(
                  tag: heroTag ?? imageFile?.path ?? imageUrl ?? UniqueKey(),
                  child: imageWidget,
                ),
        ),
      ),
    );
  }
}
