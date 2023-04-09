import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_region_req.dart';
import 'package:medusa_admin/app/data/models/store/currency.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../../../data/models/store/country.dart';

class AddRegionController extends GetxController {
  AddRegionController({required this.regionsRepo, required this.storeRepo});
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

  @override
  Future<void> onInit() async {
    await loadProviders();
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
    FocusScope.of(context).unfocus();
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

    result.when((success) {
      if (success.region != null) {
        EasyLoading.showSuccess('Region added');
        Get.back();
      } else {
        EasyLoading.showError('Error adding region');
      }
    }, (error) {
      debugPrint(error.toString());
      if (error.code != null) {
        Get.snackbar('Error code ${error.code}', error.message, snackPosition: SnackPosition.BOTTOM);
        dismissLoading();
      } else {
        EasyLoading.showError('Error adding region');
      }
    });
  }

  Future<void> loadProviders() async {
    final result = await storeRepo.retrievePaymentProviders();
    final result2 = await storeRepo.retrieveTaxProviders();
    const kDuration = Duration(milliseconds: 300);

    result.when((success) async {
      paymentProviders = success.paymentProviders;
      update();
      await Future.delayed(const Duration(milliseconds: 240)).then((value) async {
        final box = providersExpansionKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint = scrollController.offset + yPosition - (Get.context?.mediaQuery.padding.top ?? 0) - 56;
        if (scrollPoint <= scrollController.position.maxScrollExtent) {
          await scrollController.animateTo(scrollPoint - 10, duration: kDuration, curve: Curves.fastOutSlowIn);
        } else {
          await scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: kDuration, curve: Curves.fastOutSlowIn);
        }
      });
    }, (error) {
      EasyLoading.showError('Error loading payment providers');
      Get.back();
      return;
    });

    // result2.when((success) {
    // }, (error) {
    //   EasyLoading.showError('Error loading tax providers');
    //   Get.back();
    //   return;
    // });
  }
}
