import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/data/repository/currency/currency_repo.dart';

import '../../../../data/models/store/currency.dart';

class AddUpdateProductController extends GetxController {
  AddUpdateProductController({required this.currencyRepo});
  CurrencyRepo currencyRepo;
  List<Currency> currencies = [];
  late Product product;
  @override
  Future<void> onInit() async {
    if (Get.arguments == null) {
      product = Product();
    } else {
      // Update existing product
      product = Get.arguments;
    }
    await loadCurrencies();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadCurrencies() async {
    final result = await currencyRepo.retrieve();
    result.fold((l) {
      print(l.currencies?.length);
      if (l.currencies != null && l.currencies!.isNotEmpty) {
        currencies = l.currencies!;
      } else {
        // Handle in case there is no currencies in the store.
      }
    }, (r) {
      // Handle error here.
    });
  }
}
