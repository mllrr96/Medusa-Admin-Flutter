// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:medusa_admin/domain/use_case/store/update_store_use_case.dart';
// import 'package:medusa_admin_flutter/medusa_admin.dart';
// import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
//
// class CurrenciesController extends GetxController {
//   CurrenciesController({required this.updateStoreUseCase});
//   // final CurrencyRepo currencyRepo;
//   final UpdateStoreUseCase updateStoreUseCase;
//   List<Currency> currencies = [];
//   Currency? defaultStoreCurrency = const Currency();
//
//   @override
//   Future<void> onInit() async {
//     if (StoreService.store?.currencies == null || StoreService.store?.defaultCurrency == null) {
//       loading(status: 'Loading Store Info');
//       await StoreService.instance.loadStore();
//       dismissLoading();
//     }
//     currencies = StoreService.store?.currencies ?? [];
//     defaultStoreCurrency = StoreService.store?.defaultCurrency ?? const Currency();
//     update();
//     super.onInit();
//   }
//
//   Future<void> updateStore(BuildContext context) async {
//     List<String> currenciesIsoCode = [];
//     for (var currency in currencies) {
//       currenciesIsoCode.add(currency.code!);
//     }
//
//     if (currencies == StoreService.store?.currencies && defaultStoreCurrency == StoreService.store?.defaultCurrency) {
//       context.popRoute();
//       return;
//     }
//
//     loading();
//     final result = await updateStoreUseCase(
//         StorePostReq(defaultCurrencyCode: defaultStoreCurrency?.code, currencies: currenciesIsoCode));
//     result.when((success) async {
//       await StoreService.instance.loadStore();
//       EasyLoading.showSuccess('Currencies updated').then((value) => context.popRoute());
//     }, (error) {
//       debugPrint(error.toString());
//       EasyLoading.showError('Error updating currencies');
//     });
//   }
// }
