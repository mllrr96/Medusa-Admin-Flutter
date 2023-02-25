import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../../../data/models/req/user_post_auth_req.dart';
import '../../../data/repository/store/store_repo.dart';
import '../../../data/service/storage_service.dart';
import '../../../data/service/store_service.dart';
import '../../components/easy_loading.dart';

class SignInController extends GetxController {
  SignInController({required this.authRepository});
  AuthRepo authRepository;
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    emailCtrl.text = 'admin@medusa-test.com';
    passwordCtrl.text = 'supersecret';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }

  Future<void> signIn(BuildContext context) async {
    if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      errorMessage.value = 'Email & Password are required to sign in';
      return;
    }
    errorMessage.value = '';
    // To hide the keyboard

    FocusScope.of(context).unfocus();
    loading();
    final result =
        await authRepository.signIn(req: UserPostAuthReq(email: emailCtrl.text, password: passwordCtrl.text));

    result.fold((l) async {
      await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init(), permanent: true);
      Get.offAllNamed(Routes.DASHBOARD);
      dismissLoading();
    }, (r) {
      errorMessage.value = 'Error singing in, ${r.getMessage()}';
      dismissLoading();
    });
  }

  Future<void> updateBaseUrl(BuildContext context) async {
    await showTextInputDialog(
        context: context,
        title: 'Change BaseUrl',
        message: 'Current baseUrl:\n ${StorageService.baseUrl}',
        textFields: [
          DialogTextField(validator: (val) {
            if (val == null || val.removeAllWhitespace.isEmpty) {
              return "Url can't be empty";
            }
            return null;
          })
        ]).then((result) async {
      if (result != null) {
        String? url = result[0];
        final updateResult = await StorageService.instance.updateUrl(url);
        if (updateResult) {
          EasyLoading.showSuccess('Url updated, restart the app');
        } else {
          EasyLoading.showError('Error saving url');
        }
      }
    });
  }
}
