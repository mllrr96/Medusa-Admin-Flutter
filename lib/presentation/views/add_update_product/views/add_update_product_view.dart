import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/extension/product_extension.dart';
import 'package:medusa_admin/core/extension/product_variant_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/models/update_product_req.dart';
import 'package:medusa_admin/data/models/wrapped.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/presentation/cubits/upload_files/upload_files_cubit.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

import '../components/index.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class AddUpdateProductView extends StatefulWidget {
  const AddUpdateProductView({super.key, this.updateProductReq});
  final UpdateProductReq? updateProductReq;

  @override
  State<AddUpdateProductView> createState() => _AddUpdateProductViewState();
}

class _AddUpdateProductViewState extends State<AddUpdateProductView> {
  List<ImageData> imagesToDelete = [];
  List<File> images = [];
  File? thumbnailImage;
  Product? product;
  bool get updateMode => widget.updateProductReq != null;
  late ProductCrudBloc productCrudBloc;
  late UploadFilesCubit uploadFilesCubit;
  final keyForm = GlobalKey<FormState>();
  final generalTileCtrl = FlexExpansionTileController();
  final organizeTileCtrl = FlexExpansionTileController();
  final variantTileCtrl = FlexExpansionTileController();
  final attributeTileCtrl = FlexExpansionTileController();
  final thumbnailTileCtrl = FlexExpansionTileController();
  final mediaTileCtrl = FlexExpansionTileController();

  @override
  void initState() {
    productCrudBloc = ProductCrudBloc.instance;
    uploadFilesCubit = UploadFilesCubit.instance;
    product = widget.updateProductReq?.product;
    Future.delayed(350.milliseconds).then((value) {
      switch (widget.updateProductReq?.number) {
        case 1:
          generalTileCtrl.expand();
          break;
        case 2:
          organizeTileCtrl.expand();
          break;
        case 3:
          variantTileCtrl.expand();
          break;
        case 4:
          attributeTileCtrl.expand();
          break;
        case 5:
          thumbnailTileCtrl.expand();
          break;
        case 6:
          mediaTileCtrl.expand();
          break;
        default:
          break;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // productCrudBloc.close();
    // uploadFilesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // You can not be a good person until you know how much
    // evil you contain within you

    const space = Gap(12);
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductCrudBloc, ProductCrudState>(
          bloc: productCrudBloc,
          listener: (context, state) {
            state.maybeWhen(
              loading: (_) => loading(),
              product: (product) {
                dismissLoading();
                context.showSnackBar('Product Created');
                context.maybePop(product);
              },
              updated: (product) {
                dismissLoading();
                context.showSnackBar('Product Updated');
                context.maybePop(product);
              },
              error: (failure) {
                dismissLoading();
                context.showSnackBar(failure.toSnackBarString());
              },
              orElse: () => dismissLoading(),
            );
          },
        ),
        BlocListener<UploadFilesCubit, UploadFilesState>(
          bloc: uploadFilesCubit,
          listener: (context, state) {
            state.mapOrNull(
              uploading: (_) {
                loading();
              },
              uploaded: (state) {
                dismissLoading();
                final newImages = List<ImageData>.from(product?.images ?? []);
                for (var url in state.urls) {
                  newImages.add(ImageData(url: url));
                }
                product = product?.copyWith(images: newImages);
                context.showSnackBar('Images uploaded');
              },
              error: (state) {
                dismissLoading();
                context.showSnackBar(state.failure.toSnackBarString());
              },
            );
          },
        ),
      ],
      child: PopScope(
        onPopInvoked: (val) => deleteTempImages(),
        child: HideKeyboard(
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              leading: const CloseButton(),
              title: updateMode
                  ? const Text('Update Product')
                  : const Text('New Product'),
              actions: [
                TextButton(
                    onPressed: () async {
                      if (!keyForm.currentState!.validate()) {
                        generalTileCtrl.expand();
                        return;
                      }
                      keyForm.currentState!.save();
                      context.unfocus();
                      if (updateMode) {
                        await updateProduct();
                      } else {
                        await createProduct();
                      }
                    },
                    child: updateMode
                        ? const Text('Save')
                        : const Text('Publish')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        ProductGeneralInformation(
                            controller: generalTileCtrl,
                            product: product,
                            onSaved: (product) {
                              if (this.product == null) {
                                this.product = const Product();
                              }
                              this.product = this.product?.copyWith(
                                    title: product.title,
                                    subtitle: product.subtitle,
                                    handle: product.handle,
                                    material: product.material,
                                    description: product.description,
                                    discountable: product.discountable,
                                  );
                            }),
                        space,
                        ProductOrganize(
                          controller: organizeTileCtrl,
                          updateMode: updateMode,
                          product: product,
                          onSaved: (product) {
                            if (this.product == null) {
                              this.product = const Product();
                            }
                            this.product = this.product?.copyWith(
                                  collection: product.collection,
                                  tags: product.tags,
                                  type: product.type,
                                  salesChannels: product.salesChannels,
                                );
                            setState(() {});
                          },
                        ),
                        space,
                        ProductVariants(
                          product: product,
                          controller: variantTileCtrl,
                          onSaved: (product) {
                            if (this.product == null) {
                              this.product = const Product();
                            }
                            this.product = this.product?.copyWith(
                                  options: product.options,
                                  variants: product.variants,
                                );
                          },
                        ),
                        space,
                        ProductAttributes(
                          controller: attributeTileCtrl,
                          product: product,
                          onSaved: (product) {
                            if (this.product == null) {
                              this.product = const Product();
                            }
                            this.product = this.product?.copyWith(
                                  width: product?.width,
                                  length: product?.length,
                                  height: product?.height,
                                  weight: product?.weight,
                                  midCode: product?.midCode,
                                  hsCode: product?.hsCode,
                                  originCountry:
                                      Wrapped.value(product?.originCountry),
                                );
                          },
                        ),
                        space,
                        ProductThumbnail(
                          controller: thumbnailTileCtrl,
                          updateMode: updateMode,
                          product: product,
                          thumbnail: thumbnailImage,
                          onChanged: (thumbnail) {
                            thumbnailImage = thumbnail;
                            if (thumbnail == null) {
                              product = product?.copyWith(
                                  thumbnail: const Wrapped.value(null));
                            }
                          },
                        ),
                        space,
                        ProductMedia(
                          controller: mediaTileCtrl,
                          product: product,
                          updateMode: updateMode,
                          onMediaChanged: (images, imagesToDelete) {
                            this.images = images;
                            this.imagesToDelete = imagesToDelete;
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deleteTempImages() {
    try {
      final imagesToDelete = List<File>.from(images);
      images.clear();
      if (imagesToDelete.isNotEmpty) {
        for (var file in imagesToDelete) {
          file.deleteSync();
        }
      }
      final thumbnailToDelete = thumbnailImage;
      thumbnailImage = null;
      if (thumbnailToDelete != null) {
        thumbnailToDelete.deleteSync();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createProduct() async {
    productCrudBloc
        .add(ProductCrudEvent.create(PostProductReq(product: product!)));
  }

  Future<void> updateProduct() async {
    for (var element in imagesToDelete) {
      if (element.url != null) {
        await uploadFilesCubit.deleteFile(element.url!);
      }
    }

    if (images.isNotEmpty) {
      uploadFilesCubit.uploadFiles(images);
    }
    final originalProduct = widget.updateProductReq!.product;
    productCrudBloc.add(ProductCrudEvent.update(
      widget.updateProductReq!.product.id!,
      PostUpdateProductReq(
        title: originalProduct.title == product!.title ? null : product!.title,
        subtitle: originalProduct.subtitle == product!.subtitle
            ? null
            : product!.subtitle,
        handle:
            originalProduct.handle == product!.handle ? null : product!.handle,
        material: originalProduct.material == product!.material
            ? null
            : product!.material,
        description: originalProduct.description == product!.description
            ? null
            : product!.description,
        discountable: product!.discountable,
        tags: product!.tags
            ?.map((e) => ProductTag(value: e.value, id: e.id))
            .toList(),
        type: product!.type != null
            ? ProductType(value: product!.type?.value, id: product!.type?.id)
            : null,
        salesChannels: product!.salesChannels!
            .map((e) => SalesChannel(name: null, id: e.id))
            .toList(),
        variants: product!.variants?.map((e) => e.forUpdate()).toList(),
        width: originalProduct.width == product!.width ? null : product!.width,
        length:
            originalProduct.length == product!.length ? null : product!.length,
        height:
            originalProduct.height == product!.height ? null : product!.height,
        weight:
            originalProduct.weight == product!.weight ? null : product!.weight,
        midCode: originalProduct.midCode == product!.midCode
            ? null
            : product!.midCode,
        hsCode:
            originalProduct.hsCode == product!.hsCode ? null : product!.hsCode,
        originCountry: originalProduct.originCountry == product!.originCountry
            ? null
            : product!.originCountry,
        thumbnail: originalProduct.thumbnail == product!.thumbnail
            ? null
            : product!.thumbnail,
        collectionId: originalProduct.collectionId == product!.collection?.id
            ? null
            : product!.collection?.id,
        images: product!.images?.map((e) => e.url!).toList(),
      ),
    ));
  }
}
