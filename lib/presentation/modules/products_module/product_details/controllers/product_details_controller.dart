import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/product/product_details_use_case.dart';
import 'package:medusa_admin/presentation/modules/products_module/products/controllers/products_controller.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';


class ProductDetailsController extends GetxController with StateMixin<Product> {
  ProductDetailsController(
      {required this.productDetailsUseCase, required this.productId});
  ProductDetailsUseCase productDetailsUseCase;
  final String productId;
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
    final result = await productDetailsUseCase.fetchProduct(
      productId,
      queryParameters: {
        'expand':
            'images,options,variants,collection,tags,sales_channels,options.values'
      },
    );
    result.when((success) async {
      change(await _fetchProductVariants(success), status: RxStatus.success());
      update();
    }, (error) {
      change(null, status: RxStatus.error());
    });
  }

  Future<Product> _fetchProductVariants(Product product) async {
    if (product.variants == null) {
      return product;
    }
    List<ProductVariant> variants = [];
    for (ProductVariant variant in product.variants!) {
      final result = await productDetailsUseCase.fetchVariants(
          queryParameters: {'id': variant.id!, 'expand': 'options,prices'});
      result.when((success) {
        variants.addAll(success);
      }, (error) {});
    }

    if (variants.isNotEmpty) {
      return product.copyWith.variants(variants);
    }

    return product;
  }

  Future<void> deleteProduct(String id, BuildContext context) async {
    final result = await productDetailsUseCase.deleteProduct(id: id);
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
    final result = await productDetailsUseCase.updateProduct(
      id: product.id!,
      userPostUpdateProductReq: UserPostUpdateProductReq(
        discountable: product.discountable,
        status: product.status == ProductStatus.published
            ? ProductStatus.draft
            : ProductStatus.published,
      ),
    );
    result.when((success) async {
      EasyLoading.showSuccess('Product updated');
      await fetchProduct();
      ProductsController.instance.pagingController.refresh();
    }, (error) => EasyLoading.showError('Update failed'));
  }
}
