import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/gift_card/gift_card_repo.dart';

import '../controllers/create_update_custom_gift_card_controller.dart';

class CreateUpdateCustomGiftCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUpdateCustomGiftCardController>(
      () => CreateUpdateCustomGiftCardController(giftCardRepo: GiftCardRepo()),
    );
  }
}
