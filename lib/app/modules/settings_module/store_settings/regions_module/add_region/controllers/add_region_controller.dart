import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_region_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../../data/service/store_service.dart';

class AddRegionController extends GetxController {
  AddRegionController(
      {required this.regionsRepo,
      required this.storeRepo,
      required this.region});
  final RegionsRepo regionsRepo;
  final StoreRepo storeRepo;
  final titleCtrl = TextEditingController();
  final defaultTaxRateCtrl = TextEditingController();
  final defaultTextCode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Country> selectedCountries = [];
  List<PaymentProvider>? paymentProviders;
  List<String> selectedPaymentProviders = [];
  List<FulfillmentProvider>? fulfillmentProviders;
  Currency? selectedCurrency;
  final providersExpansionKey = GlobalKey();
  final scrollController = ScrollController();
  final Region? region;
  bool get updateMode => region != null;

  @override
  Future<void> onInit() async {
    if (updateMode) {
      loadRegion();
    }
    // await fetchProviders();
    super.onInit();
  }

  @override
  void onClose() {
    titleCtrl.dispose();
    defaultTaxRateCtrl.dispose();
    defaultTextCode.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> createRegion(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.unfocus();
    var countriesIso = <String>[];

    for (Country country in selectedCountries) {
      countriesIso.add(country.iso2!);
    }

    loading();
    final result = await regionsRepo.create(
      userCreateRegionReq: UserCreateRegionReq(
        name: titleCtrl.text,
        currencyCode: selectedCurrency!.code!,
        taxRate: double.parse(defaultTaxRateCtrl.text),
        // taxCode: defaultTextCode.text,
        paymentProviders: selectedPaymentProviders,
        fulfillmentProviders: [],
        countries: countriesIso,
      ),
    );

    result.when((success) {
      if (success.region != null) {
        EasyLoading.showSuccess('Region added');
        context.popRoute();
      } else {
        EasyLoading.showError('Error adding region');
      }
    }, (error) {
      debugPrint(error.toString());
      if (error.code != null) {
        Get.snackbar('Error code ${error.code}', error.message,
            snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      } else {
        EasyLoading.showError('Error adding region');
      }
    });
  }

  Future<void> updateRegion(BuildContext context) async {
    if (!formKey.currentState!.validate() || !updateMode) {
      return;
    }
    context.unfocus();
    var countriesIso = <String>[];

    for (Country country in selectedCountries) {
      countriesIso.add(country.iso2!);
    }

    loading();
    final result = await regionsRepo.update(
      id: region!.id!,
      userUpdateRegionReq: UserUpdateRegionReq(
        name: titleCtrl.text,
        currencyCode: selectedCurrency!.code!,
        countries: countriesIso,
        paymentProviderIds: selectedPaymentProviders,
      ),
    );

    result.when((success) {
      if (success.region != null) {
        EasyLoading.showSuccess('Region added');
        context.popRoute();
      } else {
        EasyLoading.showError('Error adding region');
      }
    }, (error) {
      debugPrint(error.toString());
      if (error.code != null) {
        Get.snackbar('Error code ${error.code}', error.message,
            snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      } else {
        EasyLoading.showError('Error adding region');
      }
    });
  }

  Future<void> fetchProviders() async {
    final result = await storeRepo.retrievePaymentProviders();
    result.when((success) async {
      paymentProviders = success.paymentProviders;
      update();
      await providersExpansionKey.currentContext.ensureVisibility();
    }, (error) {
      EasyLoading.showError('Error loading payment providers');
      return;
    });

    // result2.when((success) {
    // }, (error) {
    //   EasyLoading.showError('Error loading tax providers');
    //   Get.back();
    //   return;
    // });
  }

  void loadRegion() {
    titleCtrl.text = region!.name ?? '';
    selectedCurrency = StoreService.store.currencies!
        .where((element) => element.code == region!.currencyCode)
        .first;
    selectedCountries = region!.countries ?? [];
    selectedPaymentProviders =
        region!.paymentProviders?.map((e) => e.id!).toList() ?? [];
  }
}
