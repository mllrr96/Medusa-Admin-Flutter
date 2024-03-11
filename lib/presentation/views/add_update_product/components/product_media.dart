import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import 'package:image_picker/image_picker.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/data/helper/image_picker_helper.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'image_card.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductMedia extends StatefulWidget {
  const ProductMedia(
      {super.key,
      required this.product,
      required this.updateMode,
      this.onMediaChanged,
      this.controller});
  final Product? product;
  final bool updateMode;
  final void Function(
    List<File> images,
    List<ImageData> imagesToDelete,
  )? onMediaChanged;
  final FlexExpansionTileController? controller;

  @override
  State<ProductMedia> createState() => _ProductMediaState();
}

class _ProductMediaState extends State<ProductMedia> {
  List<File> images = [];
  List<ImageData> imagesToDelete = [];
  bool get updateMode => widget.updateMode;
  Product? get product => widget.product;
  final ImagePickerHelper imagePickerHelper = ImagePickerHelper.instance;
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return FormField(
      onSaved: (_) {
        widget.onMediaChanged?.call(images, imagesToDelete);
      },
      builder: (_) => FlexExpansionTile(
        key: key,
        controller: widget.controller,
        title: const Text('Media'),
        onExpansionChanged: (expanded) async {
          if (expanded) {
            await key.currentContext.ensureVisibility();
          }
        },
        child: Column(
          children: [
            Text('Add images to your product.',
                style: smallTextStyle?.copyWith(color: manatee)),
            space,
            if (updateMode && (product?.images?.isNotEmpty ?? false))
              Column(
                children: [
                  ListView.separated(
                      separatorBuilder: (_, __) => space,
                      itemCount: product!.images!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final image = product!.images![index];
                        return Opacity(
                          opacity: imagesToDelete
                                  .map((e) => e.url)
                                  .toList()
                                  .contains(image.url)
                              ? 0.5
                              : 1.0,
                          child: NetworkImageCard(
                            image.url ?? '',
                            deleteIconColor: imagesToDelete
                                    .map((e) => e.url)
                                    .toList()
                                    .contains(image.url)
                                ? Colors.red
                                : null,
                            onDelete: () {
                              if (imagesToDelete
                                  .map((e) => e.url)
                                  .toList()
                                  .contains(image.url)) {
                                imagesToDelete.removeWhere(
                                    (element) => element.url == image.url);
                              } else {
                                imagesToDelete.add(image);
                              }
                              setState(() {});
                            },
                          ),
                        );
                      }),
                  if (images.isNotEmpty) const Divider(),
                ],
              ),
            if (images.isNotEmpty)
              ListView.separated(
                  separatorBuilder: (_, __) => space,
                  itemCount: images.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final image = images[index];
                    return ImageCard(
                      image,
                      onRename: () async {
                        final result = await showBarModalBottomSheet(
                            context: context,
                            backgroundColor:
                                context.theme.scaffoldBackgroundColor,
                            overlayStyle:
                                context.theme.appBarTheme.systemOverlayStyle,
                            builder: (context) {
                              return RenameFileView(image);
                            });

                        if (result is File) {
                          setState(() {
                            images[index] = result;
                          });
                        }
                      },
                      onDelete: () async {
                        try {
                          images[index].delete();
                          images.removeAt(index);
                          setState(() {});
                        } catch (e) {
                          await Fluttertoast.showToast(
                              msg: 'Error deleting image');
                        }
                      },
                      onCrop: () async {
                        final result = await imagePickerHelper.cropImage(image);
                        if (result != null) {
                          try {
                            images[index].delete();
                            images[index] = result;
                            setState(() {});
                          } catch (e) {
                            await Fluttertoast.showToast(
                                msg: 'Error cropping image');
                          }
                        }
                      },
                    );
                  }),
            Center(
              child: TextButton(
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
                      switch (imageSource) {
                        case ImageSource.camera:
                          await imagePickerHelper
                              .imagePicker(source: imageSource)
                              .then((result) {
                            if (result == null) {
                              return;
                            }
                            images.add(result);
                            setState(() {});
                          });
                        case ImageSource.gallery:
                          await imagePickerHelper
                              .multipleImagePicker()
                              .then((result) {
                            if (result.isEmpty) {
                              return;
                            }
                            images.addAll(result);
                            setState(() {});
                          });
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: const Text('Pick images')),
            )
          ],
        ),
      ),
    );
  }
}

class RenameFileView extends StatefulWidget {
  const RenameFileView(this.file, {super.key});
  final File file;

  @override
  State<RenameFileView> createState() => _RenameFileViewState();
}

class _RenameFileViewState extends State<RenameFileView> {
  final textCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  late String fileExtension;
  @override
  void initState() {
    fileExtension = widget.file.path.split('.').last;
    textCtrl.text = widget.file.path
        .split(Platform.pathSeparator)
        .last
        .replaceAll('.$fileExtension', '');
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    textCtrl.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    Future<void> renameFile() async {
      var path = widget.file.path;
      var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
      final newName = textCtrl.text.replaceAll('/', '');
      var newPath =
          '${path.substring(0, lastSeparator + 1)}$newName.$fileExtension';

      if ('${path.substring(0, lastSeparator + 1)}$newName.$fileExtension' ==
          path) {
        context.popRoute();
        return;
      }

      if (!formKey.currentState!.validate()) {
        return;
      }
      try {
        context.popRoute(widget.file.rename(newPath));
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return Container(
      padding: EdgeInsets.only(
          bottom: context.viewInsets.bottom +
              context.viewInsets.bottom),
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: const Text('Rename File'),
            actions: [
              TextButton(
                  onPressed: () async => renameFile(),
                  child: const Text('Rename'))
            ],
          ),
          Form(
            key: formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: TextFormField(
                controller: textCtrl,
                focusNode: focusNode,
                style: smallTextStyle,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Name cannot be empty';
                  }

                  if (File('${widget.file.parent.path}/$val.$fileExtension')
                      .existsSync()) {
                    return 'Another file with the same name exists';
                  }
                  return null;
                },
                maxLines: null,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))
                ],
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (val) async => renameFile(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
