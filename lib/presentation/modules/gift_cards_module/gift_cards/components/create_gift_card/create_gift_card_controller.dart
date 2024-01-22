import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/domain/use_case/product/products_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../controllers/gift_cards_controller.dart';

class CreateGiftCardController extends GetxController {
  static CreateGiftCardController get instance => Get.find<CreateGiftCardController>();
  CreateGiftCardController({required this.productsUseCase});
  final ProductsUseCase productsUseCase;
  final nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameCtrl.dispose();
    super.dispose();
  }

  var denominations = <(Currency? currency, String? amount, int index)>[];

  Future<void> createGiftCard(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    loading();
    final result = await productsUseCase.add(
      UserPostProductReq(
        product: Product(
          title: nameCtrl.text,
          isGiftCard: true,
          discountable: false,
          status: ProductStatus.published,
          options: [
            const ProductOption(
              title: 'Denomination', productId: null,
            )
          ],
          variants: denominations.map((e) {
            return ProductVariant(
                title: (denominations.indexOf(e) + 1).toString(),
                inventoryQuantity: 0,
                manageInventory: false,
                allowBackorder: false,
                prices: [
                  MoneyAmount(
                    amount: int.tryParse(e.$2?.replaceAll(',', '').replaceAll('.', '') ?? '') ?? 0,
                    currencyCode: e.$1?.code,
                  ),
                ],
                options: [
                  ProductOptionValue(
                    value: e.$2, optionId: null, variantId: null,
                  )
                ]);
          }).toList(),
        ),
      ),
    );
    result.when((success) {
      EasyLoading.showSuccess('Gift Card created');
      GiftCardsController.instance.pagingController.refresh();
      context.popRoute();
    }, (error) {
      debugPrint(error.toString());
      dismissLoading();
      Get.snackbar('Error creating gift card (${error.code ?? ''})', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
