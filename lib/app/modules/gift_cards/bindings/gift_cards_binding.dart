import 'package:get/get.dart';

import '../controllers/gift_cards_controller.dart';

class GiftCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftCardsController>(
      () => GiftCardsController(),
    );
  }
}
