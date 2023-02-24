import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

import '../../../components/easy_loading.dart';

class ProductDetailsController extends GetxController with StateMixin<Product> {
  ProductDetailsController({required this.productsRepo});
  ProductsRepo productsRepo;
  final String _productId = Get.arguments;
  late ScrollController scrollController;
  final GlobalKey variantsKey = GlobalKey();
  final GlobalKey attributesKey = GlobalKey();
  final GlobalKey thumbnailKey = GlobalKey();
  final GlobalKey imagesKey = GlobalKey();
  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await loadProduct();
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> loadProduct() async {
    change(null, status: RxStatus.loading());
    try {
      print(_productId);
      final result = await productsRepo.retrieve(
        _productId,
        queryParameters: {'expand': 'images,options,variants,collection,tags,sales_channels,options.values'},
      );
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
            await productsRepo.retrieveVariants(queryParameters: {'id': variant.id!, 'expand': 'options,prices'});
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

  Future<void> deleteProduct(String id) async {
    final result = await productsRepo.delete(id: id);
    loading();
    result.fold((l) {
      if (l.deleted != null && l.deleted!) {
        // product deleted
        EasyLoading.showSuccess('Product Deleted');
        Get.back(result: true);
      } else {
        EasyLoading.showError('Deletion failed');
      }
    }, (r) {
      // Error deleting product
      EasyLoading.showError('Deletion failed');
    });
  }

  Future<void> updateProduct(Product product) async {
    loading();
    final result = await productsRepo.update(product: product);
    result.fold((l) async {
      EasyLoading.showSuccess('Updated');
      await loadProduct();
    }, (r) {
      EasyLoading.showError('Failed to update');
      debugPrint(r.getMessage());
    });
  }
}
