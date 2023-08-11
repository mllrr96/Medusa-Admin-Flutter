import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_gift_card_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/gift_card/gift_card_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../components/currency_formatter.dart';

class CreateUpdateCustomGiftCardController extends GetxController {
  CreateUpdateCustomGiftCardController({required this.giftCardRepo});
  final GiftCardRepo giftCardRepo;
  final GiftCard? giftCard = Get.arguments;
  bool get updateMode => giftCard != null;
  Region? selectedRegion;
  DateTime? expiryDate;
  final amountCtrl = TextEditingController();
  final regionTextCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final messageCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hasExpiryDate = false;
  @override
  void onInit() {
    if (updateMode) {
      loadGiftCard();
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    amountCtrl.dispose();
    emailCtrl.dispose();
    messageCtrl.dispose();
    super.onClose();
  }

  void loadGiftCard() {
    selectedRegion = giftCard!.region;
    regionTextCtrl.text = selectedRegion?.name ?? '';
    amountCtrl.text = CurrencyTextInputFormatter(
      name: selectedRegion?.currencyCode,
    ).format((giftCard!.balance).toString());
    expiryDate = giftCard?.endsAt;
    hasExpiryDate = expiryDate != null;
    update();
  }

  Future<void> updateGiftCard() async {
    loading();
    final result = await giftCardRepo.updateGiftCard(id: giftCard!.id!, userUpdateGiftCardReq: UserUpdateGiftCardReq());

    result.when((success) {
      Get.back();
      EasyLoading.showSuccess('Updated');
      return;
    },
        (error) =>
            Get.snackbar('Error removing customer from group', error.message, snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> createGiftCard() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    loading();
    final result = await giftCardRepo.createGiftCard(
        userCreateGiftCardReq: UserCreateGiftCardReq(
      regionId: selectedRegion!.id!,
      endsAt: expiryDate,
    ));

    result.when((success) {
      Get.back();
      EasyLoading.showSuccess('Updated');
      return;
    },
        (error) =>
            Get.snackbar('Error removing customer from group', error.message, snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }
}
