import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/gift_card/gift_card_repo.dart';

class GiftCardsController extends GetxController {
  GiftCardsController({required this.giftCardRepo});
  final GiftCardRepo giftCardRepo;

  Future<void> loadGiftCards()async{
    final result = await giftCardRepo.retrieveGiftCards();
  }

}
