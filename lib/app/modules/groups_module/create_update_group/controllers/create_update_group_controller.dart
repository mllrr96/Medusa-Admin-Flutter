import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class CreateUpdateGroupController extends GetxController {
  CreateUpdateGroupController({required this.customerGroupRepo});
  final String? id = Get.arguments;
  final groupTitleCtrl = TextEditingController();
  final CustomerGroupRepo customerGroupRepo;
  final formKey = GlobalKey<FormState>();
  bool get updateMode => id != null;
  @override
  Future<void> onInit() async {
    if (id != null) {
      await _loadCustomerGroup();
    }
    super.onInit();
  }

  @override
  void onClose() {
    groupTitleCtrl.dispose();
    super.onClose();
  }

  Future<void> _loadCustomerGroup() async {
    loading();
    final result = await customerGroupRepo.retrieveCustomerGroup(id: id!);
    result.when((success) {
      return groupTitleCtrl.text = success.customerGroup?.name ?? '';
    }, (error) {
      Get.back();
      Get.snackbar('Error code ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
    });
    dismissLoading();
  }

  Future<void> updateCustomerGroup(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    loading();
    final result = await customerGroupRepo.updateCustomerGroup(id: id!, name: groupTitleCtrl.text);
    result.when((success) {
      Get.back(result: true);
      EasyLoading.showSuccess('Customer group updated!');
    }, (error) {
      dismissLoading();
      Get.snackbar('Error updating customer group (${error.code ?? ''})', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> createCustomerGroup(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    loading();
    final result = await customerGroupRepo.createCustomerGroup(name: groupTitleCtrl.text);
    result.when((success) {
      Get.back(result: true);
      EasyLoading.showSuccess('Customer group created!');
    }, (error) {
      dismissLoading();
      Get.snackbar('Error creating customer group (${error.code ?? ''})', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
