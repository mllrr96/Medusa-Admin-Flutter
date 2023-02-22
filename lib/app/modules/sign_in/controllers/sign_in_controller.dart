import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../../../data/models/req/user_post_auth_req.dart';
import '../../../data/repository/store/store_repo.dart';
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
}
