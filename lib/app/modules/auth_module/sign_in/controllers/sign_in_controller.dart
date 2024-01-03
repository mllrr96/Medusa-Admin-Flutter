import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/domain/use_case/auth_use_case.dart';
import '../../../../data/service/storage_service.dart';
import '../../../components/easy_loading.dart';

class SignInController extends GetxController {
  SignInController(this.authenticationUseCase);
  RxString errorMessage = ''.obs;
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  RxBool animate = false.obs;
  final AuthenticationUseCase authenticationUseCase;
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

  Future<bool> login(String email, String password) async {
    loading();

    try {
      await authenticationUseCase.login(email: email, password: password);
      await Get.putAsync(() => StoreService(storeRepo: getIt<MedusaAdmin>().storeRepository).init());
      dismissLoading();
      return true;
    } catch (error) {
      final failure = Failure.from(error);
      if (failure.code == 401) {
        errorMessage.value = 'Email or password is incorrect';
      } else {
        errorMessage.value = failure.message;
      }
      dismissLoading();
      return false;
    }
  }
}
