import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/reset_password_use_case.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController({required this.resetPasswordUseCase});
  final ResetPasswordUseCase resetPasswordUseCase;
  final emailCtrl = TextEditingController();
  RxString errorMessage = ''.obs;
  bool rotate = false;

  @override
  void onClose() {
    emailCtrl.dispose();
    super.onClose();
  }

  Future<bool> resetPassword() async {
    if (!_validate()) {
      return false;
    }
    errorMessage.value = '';
    rotate = true;
    update();
    final result = await resetPasswordUseCase(emailCtrl.text);
    return result.when(
      (success) {
        rotate = false;
        update();
        return true;
      },
      (error) {
        rotate = false;
        update();
        errorMessage.value = error.message;
        return false;
      },
    );
  }

  bool _validate() {
    if (emailCtrl.text.isEmpty) {
      errorMessage.value = 'Field is required';
      return false;
    }

    if (!emailCtrl.text.isEmail) {
      errorMessage.value = 'Invalid email';
      return false;
    }
    return true;
  }
}
