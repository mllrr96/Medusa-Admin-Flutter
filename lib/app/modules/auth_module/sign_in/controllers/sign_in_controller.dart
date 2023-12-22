import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';

import '../../../../data/models/req/user_post_auth_req.dart';
import '../../../../data/repository/store/store_repo.dart';
import '../../../../data/service/storage_service.dart';
import '../../../../data/service/store_service.dart';
import '../../../components/easy_loading.dart';

class SignInController extends GetxController {
  SignInController({required this.authRepository});
  AuthRepo authRepository;
  RxString errorMessage = ''.obs;
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  RxBool animate = false.obs;
  @override
  void onInit() {
    themeMode.value = StorageService.instance.loadThemeMode();
    super.onInit();
  }

  Future<void> changeThemeMode() async {
    switch (themeMode.value) {
      case ThemeMode.system:
        await StorageService.instance.saveThemeMode(ThemeMode.light);
        break;
      case ThemeMode.light:
        await StorageService.instance.saveThemeMode(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        await StorageService.instance.saveThemeMode(ThemeMode.system);
        break;
    }
    themeMode.value = StorageService.instance.loadThemeMode();
    update();
  }

  Future<bool> signIn(String email, String password) async {

    loading();
    final result =
        await authRepository.signIn(req: UserPostAuthReq(email: email, password: password));

  return  result.when((success) async {
      await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init());
      // Get.offAllNamed(Routes.DASHBOARD);
      dismissLoading();
      return true;
    }, (error) {
      if (error.code == 401) {
        errorMessage.value = 'Email or password is incorrect';
      } else {
        errorMessage.value = error.message;
      }
      dismissLoading();
      return false;
    });
  }
}
