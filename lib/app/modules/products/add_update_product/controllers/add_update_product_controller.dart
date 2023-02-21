import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../data/models/store/product_option.dart';
import '../../../../data/models/store/product_option_value.dart';
import '../components/product_variants.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({required this.productsRepo});
  ProductsRepo productsRepo;
  final titleCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  RxBool discountable = true.obs;
  RxBool salesChannels = true.obs;
  final optionCtrl = TextEditingController();
  final variationsCtrl = TextEditingController();
  final optionKeyForm = GlobalKey<FormState>();

  late Product product;
  @override
  Future<void> onInit() async {
    if (Get.arguments == null) {
      product = Product();
    } else {
      // Update existing product
      product = Get.arguments;
    }
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
    result.fold((l) {
      EasyLoading.showSuccess('New product Added');
      Get.back(result: true);
    }, (r) {
      print(r.error);
      EasyLoading.showError('Error adding product');
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
      await showModalBottomSheet(context: context, builder: builder());
    }

    optionCtrl.clear();
    variationsCtrl.clear();
  }
}
