import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/currency/currency_repo.dart';

class CurrenciesController extends GetxController {
  CurrenciesController({required this.currencyRepo});
  final CurrencyRepo currencyRepo;

  @override
  void onInit() {
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
