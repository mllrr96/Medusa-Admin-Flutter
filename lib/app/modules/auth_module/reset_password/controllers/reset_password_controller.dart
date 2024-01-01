import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import '../../../components/easy_loading.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController({required this.userRepo});
  final UserRepository userRepo;
  final emailCtrl = TextEditingController();
  RxString errorMessage = ''.obs;

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
    loading();
    final result = await userRepo.requestPasswordReset(email: emailCtrl.text);
    if (result == true) {
      EasyLoading.showSuccess('Reset instructions sent');
      return true;
    } else {
      dismissLoading();
      // errorMessage.value = error.message;
      return false;
    }
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
