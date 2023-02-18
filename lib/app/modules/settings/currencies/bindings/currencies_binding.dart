import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/currency/currency_repo.dart';

import '../controllers/currencies_controller.dart';

class CurrenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurrenciesController>(() => CurrenciesController(currencyRepo: CurrencyRepo()));
  }
}
