import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_product_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/products_module/products/controllers/products_controller.dart';

import '../../../components/easy_loading.dart';

class ProductDetailsController extends GetxController with StateMixin<Product> {
  ProductDetailsController({required this.productsRepo, required this.productId});
  ProductsRepo productsRepo;
  final String productId ;
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
    await fetchProduct();
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> fetchProduct() async {
    change(null, status: RxStatus.loading());
    try {
      final result = await productsRepo.retrieve(
        productId,
        queryParameters: {'expand': 'images,options,variants,collection,tags,sales_channels,options.values'},
      );
      if (result != null && result.product != null) {
        change(await _fetchProductVariants(result.product!), status: RxStatus.success());
        update();
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future<Product> _fetchProductVariants(Product product) async {
    try {
      if (product.variants == null) {
        return product;
      }
      List<ProductVariant> variants = [];
      for (ProductVariant variant in product.variants!) {
        final result =
            await productsRepo.retrieveVariants(queryParameters: {'id': variant.id!, 'expand': 'options,prices'});
        if (result?.variants != null) {
          variants.addAll(result?.variants?.toList() ?? []);
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

  Future<void> deleteProduct(String id, BuildContext context) async {
    final result = await productsRepo.delete(id: id);
    loading();
    result.when((success) {
      if (success.deleted != null && success.deleted!) {
        // product deleted
        EasyLoading.showSuccess('Product Deleted');
        context.popRoute(true);
      } else {
        EasyLoading.showError('Deletion failed');
      }
    }, (error) => EasyLoading.showError('Deletion failed'));
  }

  Future<void> updateProduct(Product product) async {
    // loading();
    // final result = await productsRepo.update(product: product);
    // result.when((success) async{
    //   EasyLoading.showSuccess('Updated');
    //   await loadProduct();
    // }, (error) {
    //   EasyLoading.showError('Failed to update');
    //   debugPrint(error.toString());
    // });
  }

  Future<void> publishProduct(Product product) async {
    loading();
    final result = await productsRepo.update(
      id: product.id!,
      userPostUpdateProductReq: UserPostUpdateProductReq(
        discountable: product.discountable,
        status: product.status == ProductStatus.published ? ProductStatus.draft : ProductStatus.published,
      ),
    );
    result.when((success) async {
      if (success.product != null) {
        EasyLoading.showSuccess('Product updated');
        await fetchProduct();
        ProductsController.instance.pagingController.refresh();
      } else {
        EasyLoading.showError('Update failed');
      }
    }, (error) => EasyLoading.showError('Update failed'));
  }
}
