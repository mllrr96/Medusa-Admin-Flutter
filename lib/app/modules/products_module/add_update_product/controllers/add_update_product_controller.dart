import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/helper/image_picker_helper.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/repository/product_type/product_type_repo.dart';
import 'package:medusa_admin/app/data/repository/upload/upload_repo.dart';
import 'package:medusa_admin/app/modules/components/countries/components/countries.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({
    required this.productsRepo,
    required this.productTypeRepo,
    required this.collectionRepo,
    required this.uploadRepo,
  });
  final ProductsRepo productsRepo;
  final ProductTypeRepo productTypeRepo;
  final CollectionRepo collectionRepo;
  final UploadRepo uploadRepo;
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
  ProductType? selectedProductType;
  bool discountable = true;
  bool salesChannels = true;
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
  UpdateProductReq? updateProductReq;
  File? thumbnailImage;
  List<File> images = [];
  late ScrollController scrollController;
  late Product product;
  late ImagePickerHelper imagePickerHelper;
  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    updateProductReq = Get.arguments;
    imagePickerHelper = ImagePickerHelper();
    loadProduct();
    await loadOrganize();
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
      }
    }
    super.onReady();
  }

  Future<void> loadOrganize() async {
    final result = await productTypeRepo.retrieveProductTypes();
    result.when((success) {
      productTypes = success.productTypes;
    }, (error) => null);
    final result2 = await collectionRepo.retrieveAll();
    result2.when((success) {
      collections = success.collections;
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

  Future<void> addProduct() async {
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
      EasyLoading.showSuccess('New product Added').then((value) {
        loading(status: 'Uploading Images');
      });
      if (images.isNotEmpty || thumbnailImage != null) {
        List<File> filesToUpload = [];
        filesToUpload.addAll(images);
        if (thumbnailImage != null) {
          filesToUpload.add(thumbnailImage!);
        }
        final imageResult = await uploadRepo.uploadFile(files: filesToUpload);
        imageResult.when((imageSuccess) async {
          final productResult = await productsRepo.update(
              userPostUpdateProductReq: UserPostUpdateProductReq(images: imageSuccess.urls), id: success.id!);
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
      Get.back(result: true);
    }, (error) {
      debugPrint(error.toString());
      EasyLoading.showError('Error adding product');
    });
  }

  Future<void> updateProduct(BuildContext context) async {
    // Check if there's no update to the product, in that case just go back.

    // Product updatedProduct = Product(id: product.id!, status: product.status, discountable: product.discountable);
    // switch (productComponents) {
    //   case ProductComponents.generalInfo:
    //     updatedProduct = updatedProduct.copyWith(
    //       title: product.title == titleCtrl.text ? null : titleCtrl.text,
    //       subtitle: product.subtitle == subtitleCtrl.text ? null : subtitleCtrl.text,
    //       handle: product.handle == handleCtrl.text ? null : handleCtrl.text,
    //       material: product.material == materialCtrl.text ? null : materialCtrl.text,
    //       description: product.description == descriptionCtrl.text ? null : descriptionCtrl.text,
    //       discountable: product.discountable == discountable.value ? null : discountable.value,
    //     );
    //     break;
    //   case ProductComponents.salesChannel:
    //     // TODO: Handle this case.
    //     break;
    //   case ProductComponents.addVariant:
    //     // TODO: Handle this case.
    //     break;
    //   case ProductComponents.editVariants:
    //     // updatedProduct = updatedProduct.copyWith(
    //     //   width: product.width == widthC
    //     // );
    //     break;
    //   case ProductComponents.editOptions:
    //     // TODO: Handle this case.
    //     break;
    //   case ProductComponents.editAttributes:
    //   case ProductComponents.editThumbnail:
    //   case ProductComponents.editMedia:
    //     break;
    // }
    //
    // // Hide the keyboard
    // FocusScope.of(context).unfocus();
    // loading();
    // final result = await productsRepo.update(product: updatedProduct);
    // result.when((success) {
    //   Get.back(result: success.product!);
    //   EasyLoading.showSuccess('Product Updated');
    // }, (error) {
    //   EasyLoading.showError('Error updating product');
    //   debugPrint(error.message);
    // });
  }

  void loadProduct() {
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
      selectedCollection = product.collection;
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
