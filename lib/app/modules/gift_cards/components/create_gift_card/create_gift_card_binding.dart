import 'package:get/get.dart';
import '../../../../data/repository/product/products_repo.dart';
import 'create_gift_card_controller.dart';

class CreateGiftCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateGiftCardController(productsRepo: ProductsRepo()));
  }
}
