import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/repository/product_type/product_type_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/enums.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({required this.productsRepo, required this.productTypeRepo, required this.collectionRepo});
  final ProductsRepo productsRepo;
  final ProductTypeRepo productTypeRepo;
  final CollectionRepo collectionRepo;
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


  List<ProductCollection>? collections;
  List<ProductType>? productTypes;
  ProductCollection? selectedCollection;
  ProductType? selectedProductType;
  RxBool discountable = true.obs;
  RxBool salesChannels = true.obs;
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
  ProductComponents productComponents = ProductComponents.addVariant;
  late ScrollController scrollController;
  late Product product;
  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    loadProduct();
    await loadOrganize();
    super.onInit();
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
    if (keyForm.currentState == null || !keyForm.currentState!.validate()) {
      return;
    }

    product = product.copyWith(title: titleCtrl.text);

    loading();
    final result = await productsRepo.add(userPostProductReq: UserPostProductReq(product: product));
    result.when((success) {
      EasyLoading.showSuccess('New product Added');
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
      product = Get.arguments[0];
      productComponents = Get.arguments[1];
      switch (productComponents) {
        case ProductComponents.generalInfo:
          titleCtrl.text = product.title ?? '';
          subtitleCtrl.text = product.subtitle ?? '';
          handleCtrl.text = product.handle ?? '';
          materialCtrl.text = product.material ?? '';
          descriptionCtrl.text = product.description ?? '';
          discountable.value = product.discountable;
          break;
        case ProductComponents.salesChannel:
          // TODO: Handle this case.
          break;
        case ProductComponents.addVariant:
          // TODO: Handle this case.
          break;
        case ProductComponents.editVariants:
          // TODO: Handle this case.
          break;
        case ProductComponents.editOptions:
          // TODO: Handle this case.
          break;
        case ProductComponents.editAttributes:
          // TODO: Handle this case.
          break;
        case ProductComponents.editThumbnail:
          // TODO: Handle this case.
          break;
        case ProductComponents.editMedia:
          // TODO: Handle this case.
          break;
      }
    }
  }
}
