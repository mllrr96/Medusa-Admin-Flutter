import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_create_region_req.dart';
import 'package:medusa_admin/app/data/models/store/currency.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../../data/models/store/country.dart';

class AddRegionController extends GetxController {
  AddRegionController({required this.regionsRepo});
  final RegionsRepo regionsRepo;

  final titleCtrl = TextEditingController();
  final defaultTaxRateCtrl = TextEditingController();
  final defaultTextCode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Country> selectedCountries = [];
  Currency? selectedCurrency;
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
    titleCtrl.dispose();
    defaultTaxRateCtrl.dispose();
    defaultTextCode.dispose();
    super.onClose();
  }

  Future<void> createRegion() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
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
        paymentProviders: [],
        fulfillmentProviders: [],
        countries: countriesIso,
      ),
    );
    result.fold((l) {
      if (l.region != null) {
        EasyLoading.showSuccess('Region added');
        Get.back();
      } else {
        EasyLoading.showError('Error adding region');
      }
    }, (r) => EasyLoading.showError('Error adding region'));
  }
}
