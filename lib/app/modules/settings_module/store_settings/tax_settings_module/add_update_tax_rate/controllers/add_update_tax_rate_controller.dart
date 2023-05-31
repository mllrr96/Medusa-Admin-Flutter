import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../../../data/models/req/user_tax_rate.dart';
import '../../../../../../data/repository/tax_rate/tax_rate_repo.dart';

class AddUpdateTaxRateController extends GetxController {
  AddUpdateTaxRateController({required this.taxRateRepo});
  final TaxRateRepo taxRateRepo;
  AddUpdateTaxRateReq addUpdateTaxRateReq = Get.arguments;
  TaxRate? get taxRate => addUpdateTaxRateReq.taxRate;
  bool get updateMode => taxRate != null;
  final nameCtrl = TextEditingController();
  final taxRateCtrl = TextEditingController();
  final taxCodeCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (updateMode) {
      nameCtrl.text = taxRate!.name ?? '';
      taxRateCtrl.text = taxRate!.rate?.toString() ?? '';
      taxCodeCtrl.text = taxRate!.code ?? '';
    }
    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    taxRateCtrl.dispose();
    taxCodeCtrl.dispose();
    super.onClose();
  }

  Future<void> create() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    loading();
    final result = await taxRateRepo.createTaxRate(
      userCreateTaxRateReq: UserCreateTaxRateReq(
        code: taxCodeCtrl.text,
        name: nameCtrl.text,
        regionId: addUpdateTaxRateReq.regionId,
        rate: double.tryParse(taxRateCtrl.text),
      ),
    );

    result.when((success) {
      EasyLoading.showSuccess('Tax rate created');
      dismissLoading();
      Get.back(result: true);
    }, (error) {
      Get.snackbar('Error creating tax rate ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }

  Future<void> updateTaxRate() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    loading();
    final result = await taxRateRepo.updateTaxRate(
      id: taxRate!.id!,
      userUpdateTaxRateReq: UserUpdateTaxRateReq(
        code: taxCodeCtrl.text,
        name: nameCtrl.text,
        regionId: addUpdateTaxRateReq.regionId,
        rate: double.tryParse(taxRateCtrl.text),
      ),
    );

    result.when((success) {
      EasyLoading.showSuccess('Tax rate created');
      dismissLoading();
      Get.back(result: true);
    }, (error) {
      Get.snackbar('Error creating tax rate ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }
}

class AddUpdateTaxRateReq {
  final String regionId;
  final TaxRate? taxRate;
  AddUpdateTaxRateReq({
    required this.regionId,
    this.taxRate,
  });
}
