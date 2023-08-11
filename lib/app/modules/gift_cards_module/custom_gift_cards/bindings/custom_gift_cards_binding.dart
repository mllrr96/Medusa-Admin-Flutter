import 'package:get/get.dart';

import '../../../../data/repository/gift_card/gift_card_repo.dart';
import '../controllers/custom_gift_cards_controller.dart';

class CustomGiftCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomGiftCardsController(giftCardRepo: GiftCardRepo()));
  }
}
