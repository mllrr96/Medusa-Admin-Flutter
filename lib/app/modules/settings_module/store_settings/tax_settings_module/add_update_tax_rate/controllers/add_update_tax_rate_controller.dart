import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';


class AddUpdateTaxRateController extends GetxController {
  AddUpdateTaxRateController({required this.taxRateRepo, required this.addUpdateTaxRateReq});
  final TaxRateRepository taxRateRepo;
  final AddUpdateTaxRateReq addUpdateTaxRateReq;
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

  Future<void> create(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    loading();
    final result = await taxRateRepo.createTaxRate(
      userCreateTaxRateReq: UserCreateTaxRateReq(
        code: taxCodeCtrl.text,
        name: nameCtrl.text,
        regionId: addUpdateTaxRateReq.regionId,
        rate: int.tryParse(taxRateCtrl.text),
      ),
    );

    result.when((success) {
      context.showSnackBar('Tax rate created');
      dismissLoading();
      context.popRoute(true);
    }, (error) {
      context.showSnackBar(error.toSnackBarString());
      dismissLoading();
    });
  }

  Future<void> updateTaxRate(BuildContext context) async {
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
      context.showSnackBar('Tax rate updated');
      dismissLoading();
      context.popRoute(true);
    }, (error) {
      context.showSnackBar(error.toSnackBarString());
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
