import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/data/service/store_service.dart';
import 'package:medusa_admin/domain/use_case/auth/auth_use_case.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/presentation/modules/activity_module/activity_controller.dart';
import 'package:medusa_admin/core/utils/enums.dart';

class SignInController extends GetxController {
  SignInController(this.authenticationUseCase);
  ThemeMode themeMode = ThemeMode.system;
  bool loading = false;
  final AuthenticationUseCase authenticationUseCase;
  @override
  void onInit() {
    themeMode = PreferenceService.instance.loadThemeMode();
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
            await PreferenceService.instance.saveThemeMode(ThemeMode.light));
        break;
      case ThemeMode.light:
        themeMode = ThemeMode.dark;
        update();
        Future.delayed(const Duration(milliseconds: 250)).then((value) async =>
            await PreferenceService.instance.saveThemeMode(ThemeMode.dark));
        break;
      case ThemeMode.dark:
        themeMode = ThemeMode.system;
        update();
        Future.delayed(const Duration(milliseconds: 250)).then((value) async =>
            await PreferenceService.instance.saveThemeMode(ThemeMode.system));
        break;
    }
  }

  Future<bool> login(String email, String password,
      {required BuildContext context}) async {
    if (AuthPreferenceService.authPreference.authType == AuthenticationType.jwt) {
      return await _loginJWT(email, password, context: context);
    } else {
      final result = await authenticationUseCase.loginCookie(
          email: email, password: password);
      return result.when((success) async {
        await getIt<FlutterSecureStorage>()
            .write(key: AppConstants.cookieKey, value: success);
        AuthPreferenceService.instance.setIsAuthenticated(true);
        await Get.putAsync(() =>
            StoreService(storeRepo: getIt<MedusaAdmin>().storeRepository)
                .init());
        Get.put(ActivityController());
        if (ActivityController.instance.pagingController.itemList?.isNotEmpty ??
            false) {
          ActivityController.instance.pagingController.refresh();
        }
        AuthPreferenceService.instance.setEmail(email);
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

  Future<bool> _loginJWT(String email, String password,
      {required BuildContext context}) async {
    final result =
        await authenticationUseCase.loginJWT(email: email, password: password);
    return result.when((jwt) async {
      await getIt<FlutterSecureStorage>()
          .write(key: AppConstants.jwtKey, value: jwt);
      AuthPreferenceService.instance.setIsAuthenticated(true);
      await Get.putAsync(() =>
          StoreService(storeRepo: getIt<MedusaAdmin>().storeRepository).init());
      Get.put(ActivityController());
      if (ActivityController.instance.pagingController.itemList?.isNotEmpty ??
          false) {
        ActivityController.instance.pagingController.refresh();
      }
      AuthPreferenceService.instance.setEmail(email);
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
