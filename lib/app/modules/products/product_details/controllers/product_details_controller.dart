import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

class ProductDetailsController extends GetxController with StateMixin<Product> {
  ProductDetailsController({required this.productsRepository});
  ProductsRepo productsRepository;
  final String _productId = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await loadProduct();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadProduct() async {
    change(null, status: RxStatus.loading());
    try {
      print(_productId);
      final result = await productsRepository
          .retrieve(_productId, queryParameters: {'expand': 'images,options,variants,collection,tags,sales_channels'});
      if (result != null && result.product != null) {
        change(await _loadProductVariants(result.product!), status: RxStatus.success());
        update();
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future<Product> _loadProductVariants(Product product) async {
    try {
      if (product.variants == null) {
        return product;
      }
      List<ProductVariant> variants = [];
      for (ProductVariant variant in product.variants!) {
        final result =
            await productsRepository.retrieveVariants(queryParameters: {'id': variant.id!, 'expand': 'options,prices'});
        if (result != null && result.variants != null) {
          variants.addAll(result.variants!.toList());
        }
      }

      if (variants.isNotEmpty) {
        return product.copyWith.variants(variants);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return product;
  }
}
