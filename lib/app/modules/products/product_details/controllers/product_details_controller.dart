import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

class ProductDetailsController extends GetxController with StateMixin<Product> {
  ProductDetailsController({required this.productsRepository});
  ProductsRepository productsRepository;
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
      final result = await productsRepository
          .retrieve(_productId, queryParameters: {'expand': 'images,options,variants,collection,tags,sales_channels'});
      if (result != null && result.product != null) {
        change(result.product!, status: RxStatus.success());
        update();
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
