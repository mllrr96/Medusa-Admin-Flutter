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
  AuthRepository authRepository;
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

  Future<void> signIn() async {
    if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      return;
    }
    loading();
    try {
      await authRepository.signIn(req: UserPostAuthReq(email: emailCtrl.text, password: passwordCtrl.text));
      await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init(), permanent: true);
      Get.offAllNamed(Routes.DASHBOARD);
      dismissLoading();
    } catch (e) {
      errorMessage.value = 'Error singing in';
      dismissLoading();
    }
  }
}
