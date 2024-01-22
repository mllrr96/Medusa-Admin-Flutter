import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/return_reason/update_return_reason_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class CreateUpdateReturnReasonController extends GetxController {
  CreateUpdateReturnReasonController(
      {required this.updateReturnReasonUseCase, required this.returnReason});
  final UpdateReturnReasonUseCase updateReturnReasonUseCase;
  bool get updateMode => returnReason != null;
  final ReturnReason? returnReason;
  final labelCtrl = TextEditingController();
  final valueCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
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
    context.unfocus();
    loading();
    if (updateMode) {
      final result = await updateReturnReasonUseCase.update(
          id: returnReason!.id!,
          userUpdateReturnReasonReq: UserUpdateReturnReasonReq(
              label: labelCtrl.text,
              value: valueCtrl.text,
              description: descriptionCtrl.text));
      result.when((success) {
        EasyLoading.showSuccess('Updated');
        context.popRoute(true);
      }, (error) => EasyLoading.showError('Error updating'));
    } else {
      final result = await updateReturnReasonUseCase.create(
          UserCreateReturnReasonReq(
              label: labelCtrl.text,
              value: valueCtrl.text,
              description: descriptionCtrl.text.removeAllWhitespace.isEmpty
                  ? null
                  : descriptionCtrl.text));
      result.when((success) {
        EasyLoading.showSuccess('Updated');
        context.popRoute(true);
      }, (error) => EasyLoading.showError('Error updating'));
    }
  }
}
