import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/currency/currency_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';

import '../../../../data/models/store/currency.dart';

class CurrenciesController extends GetxController {
  CurrenciesController({required this.currencyRepo});
  final CurrencyRepo currencyRepo;
  late List<Currency> currencies;
  late Currency defaultStoreCurrency ;

  @override
  void onInit() {
    currencies = StoreService.store.currencies ?? [];
    defaultStoreCurrency = StoreService.store.defaultCurrency!;
    print(StoreService.store.defaultCurrency);
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

  Future<void> loadAllCurrencies() async {
    final result = await currencyRepo.retrieve();
    result.fold((l) => l.currencies, (r) => debugPrint(r.getMessage()));
  }
}
