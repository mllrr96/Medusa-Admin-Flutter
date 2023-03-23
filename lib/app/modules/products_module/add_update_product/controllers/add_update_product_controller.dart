import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../data/models/store/product_option.dart';
import '../../../../data/models/store/product_option_value.dart';
import '../components/product_variants.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({required this.productsRepo});
  ProductsRepo productsRepo;
  final titleCtrl = TextEditingController();
  final subtitleCtrl = TextEditingController();
  final handleCtrl = TextEditingController();
  final materialCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  RxBool discountable = true.obs;
  RxBool salesChannels = true.obs;
  final optionCtrl = TextEditingController();
  final variationsCtrl = TextEditingController();
  final optionKeyForm = GlobalKey<FormState>();
  bool updateMode = false;
  ProductComponents productComponents = ProductComponents.addVariant;
  late ScrollController scrollController;
  late Product product;
  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    loadProduct();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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

    Product updatedProduct = Product(id: product.id!, status: product.status, discountable: product.discountable);
    switch (productComponents) {
      case ProductComponents.generalInfo:
        updatedProduct = updatedProduct.copyWith(
          title: product.title == titleCtrl.text ? null : titleCtrl.text,
          subtitle: product.subtitle == subtitleCtrl.text ? null : subtitleCtrl.text,
          handle: product.handle == handleCtrl.text ? null : handleCtrl.text,
          material: product.material == materialCtrl.text ? null : materialCtrl.text,
          description: product.description == descriptionCtrl.text ? null : descriptionCtrl.text,
          discountable: product.discountable == discountable.value ? null : discountable.value,
        );
        break;
      case ProductComponents.salesChannel:
        // TODO: Handle this case.
        break;
      case ProductComponents.addVariant:
        // TODO: Handle this case.
        break;
      case ProductComponents.editVariants:
        // updatedProduct = updatedProduct.copyWith(
        //   width: product.width == widthC
        // );
        break;
      case ProductComponents.editOptions:
        // TODO: Handle this case.
        break;
      case ProductComponents.editAttributes:
      case ProductComponents.editThumbnail:
      case ProductComponents.editMedia:
        break;
    }

    // Hide the keyboard
    FocusScope.of(context).unfocus();
    loading();
    final result = await productsRepo.update(product: updatedProduct);
    result.when((success) {
      Get.back(result: success.product!);
      EasyLoading.showSuccess('Product Updated');
    }, (error) {
      EasyLoading.showError('Error updating product');
      debugPrint(error.message);
    });
  }

  Future<void> addAnOption(BuildContext context) async {
    Widget Function(BuildContext) builder() {
      return (context) => AddOptionView(
            formKey: optionKeyForm,
            variationsCtrl: variationsCtrl,
            optionCtrl: optionCtrl,
            onAddPressed: () {
              if (!optionKeyForm.currentState!.validate()) {
                return;
              }
              List<ProductOption>? options = product.options;
              List<String> variations = variationsCtrl.text.removeAllWhitespace.split(',');
              var variationsValue = <ProductOptionValue>[];
              if (variations.isNotEmpty) {
                variations.removeWhere((element) => element.removeAllWhitespace.isEmpty);
                for (var element in variations) {
                  variationsValue.add(ProductOptionValue(value: element));
                }
              }
              ProductOption newOption =
                  ProductOption(title: optionCtrl.text.removeAllWhitespace, values: variationsValue);
              if (options != null) {
                options.add(newOption);
              } else {
                options = [newOption];
              }
              product = product.copyWith(options: options);
              update([3]);
              Get.back();
            },
          );
    }

    if (GetPlatform.isIOS) {
      await showCupertinoModalBottomSheet(context: context, builder: builder());
    } else {
      await showModalBottomSheet(context: context, builder: builder(), isScrollControlled: true);
    }

    optionCtrl.clear();
    variationsCtrl.clear();
  }

  void loadProduct() {
    if (Get.arguments == null) {
      product = Product();
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
