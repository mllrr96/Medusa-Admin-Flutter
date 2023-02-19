import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/data/repository/currency/currency_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/models/store/currency.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({required this.currencyRepo, required this.productsRepo});
  CurrencyRepo currencyRepo;
  ProductsRepo productsRepo;
  List<Currency> currencies = [];
  final titleCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  RxBool discountable = true.obs;
  RxBool salesChannels = true.obs;

  late Product product;
  @override
  Future<void> onInit() async {
    if (Get.arguments == null) {
      product = Product();
    } else {
      // Update existing product
      product = Get.arguments;
    }
    await loadCurrencies();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadCurrencies() async {
    final result = await currencyRepo.retrieve();
    result.fold((l) {
      print(l.currencies?.length);
      if (l.currencies != null && l.currencies!.isNotEmpty) {
        currencies = l.currencies!;
      } else {
        // Handle in case there is no currencies in the store.
      }
    }, (r) {
      // Handle error here.
    });
  }

  Future<void> addProduct() async {
    // TODO: check for required fields
    if(!keyForm.currentState!.validate()){

      return;
    }

    product = product.copyWith(title: titleCtrl.text);

    loading();
    final result = await productsRepo.add(userPostProductReq: UserPostProductReq(product: product));

    result.fold((l) {
      EasyLoading.showSuccess('New product Added');
    }, (r) {
      print(r.error);
      EasyLoading.showError('Error adding product');
    });
  }
}
