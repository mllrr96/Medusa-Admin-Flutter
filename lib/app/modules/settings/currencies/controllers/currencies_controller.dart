import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/store_post_req.dart';
import 'package:medusa_admin/app/data/repository/currency/currency_repo.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/models/store/currency.dart';

class CurrenciesController extends GetxController {
  CurrenciesController({required this.currencyRepo, required this.storeRepo});
  final CurrencyRepo currencyRepo;
  final StoreRepo storeRepo;
  List<Currency> currencies = [];
  Currency defaultStoreCurrency = Currency();

  @override
  Future<void> onInit() async {
    if (StoreService.store.currencies == null || StoreService.store.defaultCurrency == null) {
      loading(status: 'Loading Store Info');
      await StoreService.instance.loadStore();
      dismissLoading();
    }
    currencies = StoreService.store.currencies ?? [];
    defaultStoreCurrency = StoreService.store.defaultCurrency!;
    update();
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

  Future<void> updateStore() async {
    List<String> currenciesIsoCode = [];
    for (var currency in currencies) {
      currenciesIsoCode.add(currency.code!);
    }

    if (currencies == StoreService.store.currencies && defaultStoreCurrency == StoreService.store.defaultCurrency) {
      Get.back();
      return;
    }

    loading();
    final result = await storeRepo.update(
        storePostReq: StorePostReq(defaultCurrencyCode: defaultStoreCurrency.code!, currencies: currenciesIsoCode));
    result.fold((l) async {
      await StoreService.instance.loadStore();
      EasyLoading.showSuccess('Currencies updated').then((value) => Get.back());
    }, (r) {
      debugPrint(r.getMessage());
      EasyLoading.showError('Error updating currencies');
    });
  }
}
