import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/gift_card/update_gift_card_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';

class CreateUpdateCustomGiftCardController extends GetxController {
  CreateUpdateCustomGiftCardController(
      {required this.updateGiftCardUseCase, required this.giftCard});
  final UpdateGiftCardUseCase updateGiftCardUseCase;
  final GiftCard? giftCard;
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
  void onClose() {
    amountCtrl.dispose();
    emailCtrl.dispose();
    messageCtrl.dispose();
    super.onClose();
  }

  void loadGiftCard() {
    selectedRegion = giftCard!.region;
    regionTextCtrl.text = selectedRegion?.name ?? '';
    amountCtrl.text = giftCard?.balance?.formatAsPrice(
            selectedRegion?.currencyCode,
            includeSymbol: false) ??
        '';
    expiryDate = giftCard?.endsAt;
    hasExpiryDate = expiryDate != null;
    update();
  }

  Future<void> updateGiftCard(BuildContext context) async {
    loading();
    final result = await updateGiftCardUseCase.updateGiftCard(
        id: giftCard!.id!, userUpdateGiftCardReq: UserUpdateGiftCardReq());

    result.when((success) {
      context.popRoute();
      context.showSnackBar('Gift card updated!');
    },
        (error) => context.showSnackBar(
            'Error updating gift card, ${error.toSnackBarString()}'));
    dismissLoading();
  }

  Future<void> createGiftCard(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    loading();
    final result =
        await updateGiftCardUseCase.createGiftCard(UserCreateGiftCardReq(
      value: int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), '')),
      regionId: selectedRegion!.id!,
      endsAt: expiryDate,
    ));

    result.when((success) {
      context.popRoute();
      EasyLoading.showSuccess('Updated');
      // CustomGiftCardsController.instance.pagingController.refresh();
      return;
    },
        (error) => Get.snackbar(
            'Error removing customer from group', error.message,
            snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }
}
