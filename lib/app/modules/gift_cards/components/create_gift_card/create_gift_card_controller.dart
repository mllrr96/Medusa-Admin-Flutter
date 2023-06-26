import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/gift_cards/controllers/gift_cards_controller.dart';
import '../../../../data/models/req/user_post_product_req.dart';
import '../../../../data/models/store/index.dart';
import '../../../../data/repository/product/products_repo.dart';

class CreateGiftCardController extends GetxController {
  static CreateGiftCardController get instance => Get.find<CreateGiftCardController>();
  CreateGiftCardController({required this.productsRepo});
  final ProductsRepo productsRepo;
  final nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameCtrl.dispose();
    super.dispose();
  }

  var denominations = <(Currency? currency, String? amount)>[];
  (Currency? currency, TextEditingController? textCtrl) denominationsRecord = (null, null);
  ProductVariant denominationTemplate = ProductVariant(
    prices: [
      MoneyAmount(
        amount: 0,
        currencyCode: 'usd',
      )
    ],
    options: [
      ProductOptionValue(
        value: '0',
      ),
    ],
  );

  Future<void> createGiftCard() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    loading();
    final result = await productsRepo.add(
      userPostProductReq: UserPostProductReq(
        product: Product(
          title: nameCtrl.text,
          isGiftCard: true,
          discountable: false,
          status: ProductStatus.published,
          options: [
            ProductOption(
              title: 'Denomination',
            )
          ],
          variants: denominations.map((e) {
            return ProductVariant(
                title: (denominations.indexOf(e) + 1).toString(),
                inventoryQuantity: 0,
                manageInventory: false,allowBackorder: false,
                prices: [
                  MoneyAmount(
                    amount: int.tryParse(e.$2?.replaceAll(',', '').replaceAll('.', '') ?? '') ?? 0,
                    currencyCode: e.$1?.code,
                  ),
                ],
                options: [
                  ProductOptionValue(
                    value: e.$2,
                  )
                ]);
          }).toList(),
        ),
      ),
    );
    result.when((success) {
      EasyLoading.showSuccess('Gift Card created');
      GiftCardsController.instance.productsPagingController.refresh();
      Get.back();
    }, (error) {
      print(error.toString());
      dismissLoading();
      Get.snackbar('Error creating gift card (${error.code ?? ''})', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
