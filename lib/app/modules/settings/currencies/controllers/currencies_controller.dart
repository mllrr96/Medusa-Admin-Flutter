import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/store_post_req.dart';
import 'package:medusa_admin/app/data/repository/currency/currency_repo.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';

import '../../../../data/models/store/currency.dart';

class CurrenciesController extends GetxController {
  CurrenciesController({required this.currencyRepo, required this.storeRepo});
  final CurrencyRepo currencyRepo;
  final StoreRepo storeRepo;
  late List<Currency> currencies;
  late Currency defaultStoreCurrency;

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

  Future<void> updateStore ()async {
    List<String> currenciesIsoCode = [];
    for (var currency in currencies) {
      currenciesIsoCode.add(currency.code!);
    }

    try{
      // storeRepo.update(storePostReq: StorePostReq(
      //   currencies:
      // ));
    }catch(e){}
  }

}
