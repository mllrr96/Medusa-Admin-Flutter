import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

import '../controllers/gift_cards_controller.dart';

class GiftCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GiftCardsController(productsRepo: ProductsRepo()));
  }
}
