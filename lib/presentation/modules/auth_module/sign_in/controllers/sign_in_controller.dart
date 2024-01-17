import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/data/service/store_service.dart';
import 'package:medusa_admin/domain/use_case/auth_use_case.dart';
import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:medusa_admin/presentation/modules/activity_module/activity_controller.dart';

class SignInController extends GetxController {
  SignInController(this.authenticationUseCase);
  ThemeMode themeMode = ThemeMode.system;
  bool loading = false;
  final AuthenticationUseCase authenticationUseCase;
  @override
  void onInit() {
    themeMode = StorageService.instance.loadThemeMode();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> changeThemeMode() async {
    switch (themeMode) {
      case ThemeMode.system:
        themeMode = ThemeMode.light;
        update();
        Future.delayed(const Duration(milliseconds: 250)).then((value) async =>
            await StorageService.instance.saveThemeMode(ThemeMode.light));
        break;
      case ThemeMode.light:
        themeMode = ThemeMode.dark;
        update();
        Future.delayed(const Duration(milliseconds: 250)).then((value) async =>
            await StorageService.instance.saveThemeMode(ThemeMode.dark));
        break;
      case ThemeMode.dark:
        themeMode = ThemeMode.system;
        update();
        Future.delayed(const Duration(milliseconds: 250)).then((value) async =>
            await StorageService.instance.saveThemeMode(ThemeMode.system));
        break;
    }
  }

  Future<bool> login(String email, String password,
      {required BuildContext context}) async {
    final result =
        await authenticationUseCase.login(email: email, password: password);
    return result.when((success) async {
      await Get.putAsync(() =>
          StoreService(storeRepo: getIt<MedusaAdmin>().storeRepository).init());
      Get.put(ActivityController());
      StorageService.instance.setEmail(email);
      return true;
    }, (error) {
      loading = false;
      update();
      if (error.code == 401) {
        context.showSignInErrorSnackBar('Email or password is incorrect');
      } else {
        context.showSignInErrorSnackBar(error.message);
      }
      return false;
    });
  }
}
