import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/helper/image_picker_helper.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/repository/product_type/product_type_repo.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:medusa_admin/app/data/repository/upload/upload_repo.dart';
import 'package:medusa_admin/app/modules/components/countries/components/countries.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({
    required this.productsRepo,
    required this.productTypeRepo,
    required this.collectionRepo,
    required this.uploadRepo,
    required this.salesChannelRepo,
    this.updateProductReq
  });
  final ProductsRepo productsRepo;
  final ProductTypeRepo productTypeRepo;
  final CollectionRepo collectionRepo;
  final UploadRepo uploadRepo;
  final SalesChannelRepo salesChannelRepo;
  final titleCtrl = TextEditingController();
  final subtitleCtrl = TextEditingController();
  final handleCtrl = TextEditingController();
  final materialCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  final generalKey = GlobalKey();
  final organizeKey = GlobalKey();
  final variantKey = GlobalKey();
  final attributesKey = GlobalKey();
  final thumbnailKey = GlobalKey();
  final mediaKey = GlobalKey();
  final generalTileCtrl = ExpansionTileController();
  final organizeTileCtrl = ExpansionTileController();
  final variantTileCtrl = ExpansionTileController();
  final attributeTileCtrl = ExpansionTileController();
  final thumbnailTileCtrl = ExpansionTileController();
  final mediaTileCtrl = ExpansionTileController();
  List<ProductCollection>? collections;
  List<ProductType>? productTypes;
  ProductCollection? selectedCollection;
  List<ImageData> imagesToDelete = [];
  ProductType? selectedProductType;
  bool discountable = true;
  bool enableSalesChannels = false;
  bool deleteThumbnail = false;
  List<SalesChannel>? salesChannels;
  final optionCtrl = TextEditingController();
  final variationsCtrl = TextEditingController();
  final widthCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();
  final heightCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  final midCodeCtrl = TextEditingController();
  final hsCodeCtrl = TextEditingController();
  final countryCtrl = TextEditingController();
  final optionKeyForm = GlobalKey<FormState>();
  bool updateMode = false;
 final UpdateProductReq? updateProductReq;
  File? thumbnailImage;
  List<File> images = [];
  late ScrollController scrollController;
  late Product product;
  late ImagePickerHelper imagePickerHelper;
  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    imagePickerHelper = ImagePickerHelper();
    fetchProduct();
    await fetchOrganize();
    super.onInit();
  }

  @override
  void onReady() {
    if (updateProductReq != null) {
      switch (updateProductReq!.number) {
        case 0:
          generalTileCtrl.expand();
        case 1:
          organizeTileCtrl.expand();
        case 2:
          variantTileCtrl.expand();
        case 3:
          attributeTileCtrl.expand();
        case 4:
          thumbnailTileCtrl.expand();
        case 5:
          mediaTileCtrl.expand();
      }
    }
    super.onReady();
  }

  Future<List<SalesChannel>?> fetchSalesChannels() async {
    final result = await salesChannelRepo.retrieveAll();
    return result.when((success) {
      if (success.salesChannels != null) {
        salesChannels = success.salesChannels;
        return salesChannels!;
      } else {
        return [];
      }
    }, (error) {
      return null;
    });
  }

  Future<void> fetchOrganize() async {
    final result = await productTypeRepo.retrieveProductTypes();
    result.when((success) {
      productTypes = success.productTypes;
      if (updateProductReq != null) {
        final q = productTypes?.where((element) => element.id == updateProductReq!.product.type?.id);
        selectedProductType = (q?.isNotEmpty ?? false) ? q?.first : null;
      }
    }, (error) => null);
    final result2 = await collectionRepo.retrieveAll();
    result2.when((success) {
      collections = success.collections;
      if (updateProductReq != null) {
        final q = collections?.where((element) => element.id == updateProductReq!.product.collection?.id);
        selectedCollection = (q?.isNotEmpty ?? false) ? q?.first : null;
      }
    }, (error) => null);
    update([1]);
  }

  @override
  void onClose() {
    optionCtrl.dispose();
    variationsCtrl.dispose();
    titleCtrl.dispose();
    subtitleCtrl.dispose();
    handleCtrl.dispose();
    materialCtrl.dispose();
    descriptionCtrl.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> addProduct(BuildContext context) async {
    // TODO: check for required fields
    if (!keyForm.currentState!.validate()) {
      if (!generalTileCtrl.isExpanded) {
        generalTileCtrl.expand();
      }
      return;
    }

    product = product.copyWith(title: titleCtrl.text);

    loading();
    final result = await productsRepo.add(userPostProductReq: UserPostProductReq(product: product));
    result.when((success) async {
      EasyLoading.showSuccess('New product Added');
      await _uploadImages(id: success.id!, images: images);
      await _uploadThumbnail(id: success.id!, thumbnail: thumbnailImage);
      context.popRoute(true);
    }, (error) {
      debugPrint(error.toString());
      dismissLoading();
      Get.snackbar('Error adding product', error.message,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          shouldIconPulse: false,
          borderRadius: 6,
      );
    });
  }


  Future<void> updateProduct(BuildContext context) async {
    // Check if there's no update to the product, in that case just go back.
    // Hide the keyboard
    FocusScope.of(context).unfocus();
    loading();

    final imagesToKeep = List<ImageData>.from(product.images ?? []);
    imagesToKeep.removeWhere((element) => imagesToDelete.map((e) => e.url).toList().contains(element.url));

    final result = await productsRepo.update(
      id: product.id!,
      userPostUpdateProductReq: UserPostUpdateProductReq(
        title: product.title == titleCtrl.text ? null : titleCtrl.text,
        subtitle: product.subtitle == subtitleCtrl.text ? null : subtitleCtrl.text,
        handle: product.handle == handleCtrl.text ? null : handleCtrl.text,
        material: product.material == materialCtrl.text ? null : materialCtrl.text,
        description: product.description == descriptionCtrl.text ? null : descriptionCtrl.text,
        discountable: product.discountable == discountable ? null : discountable,
        tags: product.tags,
        type: selectedProductType,
        collectionId: selectedCollection?.id,
        weight: product.weight.toString() == weightCtrl.text ? null : int.tryParse(weightCtrl.text),
        width: product.width.toString() == widthCtrl.text ? null : int.tryParse(widthCtrl.text),
        height: product.height.toString() == heightCtrl.text ? null : int.tryParse(heightCtrl.text),
        length: product.length.toString() == lengthCtrl.text ? null : int.tryParse(lengthCtrl.text),
        midCode: product.midCode == midCodeCtrl.text ? null : midCodeCtrl.text,
        hsCode: product.hsCode == hsCodeCtrl.text ? null : hsCodeCtrl.text,
        originCountry: product.originCountry,
        images: imagesToKeep.map((e) => e.url!).toList(),
        thumbnail: deleteThumbnail && thumbnailImage == null ? '' : null,
      ),
    );
    result.when(
      (success) async {
        EasyLoading.showSuccess('Product Updated');
        await _uploadImages(
          id: success.product!.id!,
          images: images,
          imagesToKeep: imagesToKeep.map((e) => e.url!).toList(),
        );

        await _uploadThumbnail(
          id: success.product!.id!,
          thumbnail: thumbnailImage,
        );

        if (imagesToDelete.isNotEmpty) {
          for (var element in imagesToDelete) {
            await uploadRepo.deleteFile(fileKey: element.id!);
          }
        }
        context.popRoute(true);
      },
      (error) {
        EasyLoading.showError('Error updating product');
        debugPrint(error.message);
      },
    );
  }


  Future<void> _uploadThumbnail({required String id, required File? thumbnail}) async {
    if (thumbnail == null) {
      return;
    }
    loading(status: 'Uploading Thumbnail');
    final imageResult = await uploadRepo.uploadFile(files: [thumbnail]);
    await imageResult.when((thumbnailSuccess) async {
      if (thumbnailSuccess.urls.isEmpty) {
        return;
      }

      final productResult = await productsRepo.update(
        userPostUpdateProductReq: UserPostUpdateProductReq(thumbnail: thumbnailSuccess.urls.first),
        id: id,
      );
      productResult.when((success) {
        EasyLoading.showSuccess('Product Updated');
      }, (error) {
        Get.snackbar('Error updating product', error.message, snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      });
    }, (error) {
      Get.snackbar('Error uploading thumbnail', error.message, snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }

  Future<void> _uploadImages({required String id, required List<File> images, List<String>? imagesToKeep}) async {
    if (images.isEmpty) {
      return;
    }
    loading(status: 'Uploading Images');
    List<File> filesToUpload = [];
    filesToUpload.addAll(images);
    final imageResult = await uploadRepo.uploadFile(files: filesToUpload);
    await imageResult.when((imageSuccess) async {
      final productResult = await productsRepo.update(
        userPostUpdateProductReq: UserPostUpdateProductReq(images: imageSuccess.urls + (imagesToKeep ?? [])),
        id: id,
      );
      productResult.when((success) {
        EasyLoading.showSuccess('Product Added');
      }, (error) {
        Get.snackbar('Error uploading product', error.message, snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      });
    }, (error) {
      Get.snackbar('Error uploading images', error.message, snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }

  void fetchProduct() {
    if (Get.arguments == null) {
      product = const Product();
    } else {
      // Update existing product
      updateMode = true;
      product = updateProductReq!.product;
      titleCtrl.text = product.title ?? '';
      subtitleCtrl.text = product.subtitle ?? '';
      handleCtrl.text = product.handle ?? '';
      materialCtrl.text = product.material ?? '';
      descriptionCtrl.text = product.description ?? '';
      discountable = product.discountable;
      selectedProductType = product.type;
      widthCtrl.text = product.width?.toString() ?? '';
      lengthCtrl.text = product.length?.toString() ?? '';
      heightCtrl.text = product.height?.toString() ?? '';
      weightCtrl.text = product.weight?.toString() ?? '';
      midCodeCtrl.text = product.midCode?.toString() ?? '';
      hsCodeCtrl.text = product.hsCode?.toString() ?? '';
      if (product.originCountry != null) {
        countryCtrl.text = countries
                .firstWhere((element) => element.iso2 == product.originCountry?.toLowerCase(),
                    orElse: () => const Country(iso2: '', iso3: '', numCode: 0, name: '', displayName: ''))
                .displayName ??
            '';
      }
    }
  }
}

class UpdateProductReq {
  final Product product;
  final int number;
  UpdateProductReq({required this.product, required this.number});
}
