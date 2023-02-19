import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({required this.productsRepo});
  ProductsRepo productsRepo;
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
}
