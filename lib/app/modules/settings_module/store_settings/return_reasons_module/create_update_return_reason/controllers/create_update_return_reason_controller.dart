import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/return_reason/return_reason_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../../../data/models/req/user_return_reason.dart';


class CreateUpdateReturnReasonController extends GetxController {
  CreateUpdateReturnReasonController({required this.returnReasonRepo});
  ReturnReasonRepo returnReasonRepo;
  bool updateMode = false;
  ReturnReason? returnReason;
  final labelCtrl = TextEditingController();
  final valueCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      updateMode = true;
      returnReason = Get.arguments;
    }
    if (updateMode) {
      labelCtrl.text = returnReason!.label ?? '';
      valueCtrl.text = returnReason!.value ?? '';
      descriptionCtrl.text = returnReason!.description ?? '';
    }
  }

  @override
  void onClose() {
    labelCtrl.dispose();
    valueCtrl.dispose();
    descriptionCtrl.dispose();
    super.onClose();
  }

  Future<void> save(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    loading();
    if (updateMode) {
      final result = await returnReasonRepo.update(
          id: returnReason!.id!,
          userUpdateReturnReasonReq: UserUpdateReturnReasonReq(
              label: labelCtrl.text, value: valueCtrl.text, description: descriptionCtrl.text));
      result.when((success) {
        EasyLoading.showSuccess('Updated');
        Get.back(result: true);
      }, (error) => EasyLoading.showError('Error updating'));
    } else {
      final result = await returnReasonRepo.create(
          userCreateReturnReasonReq: UserCreateReturnReasonReq(
              label: labelCtrl.text,
              value: valueCtrl.text,
              description: descriptionCtrl.text.removeAllWhitespace.isEmpty ? null : descriptionCtrl.text));
      result.when((success) {
        EasyLoading.showSuccess('Updated');
        Get.back(result: true);
      }, (error) => EasyLoading.showError('Error updating'));
    }
  }
}
