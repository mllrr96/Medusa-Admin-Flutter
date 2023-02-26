import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../data/service/storage_service.dart';
import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  SettingsController({required this.authRepo});
  final AuthRepo authRepo;

  late ThemeMode themeMode;

  @override
  Future<void> onInit() async {
    themeMode = StorageService.instance.loadThemeMode();
    super.onInit();
  }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    await StorageService.instance.saveThemeMode(themeMode);
    this.themeMode = themeMode;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signOut(BuildContext context) async {
    await showOkCancelAlertDialog(
            context: context,
            title: 'Sign out',
            message: 'Are you sure you want to sign out?',
            okLabel: 'Sign Out',
            isDestructiveAction: true)
        .then((value) async {
      if (value == OkCancelResult.ok) {
        loading();
        final result = await authRepo.signOut();
        if (result) {
          await Get.delete(force: true);
          await StorageService.instance.clearCookie();
          Get.offAllNamed(Routes.SPLASH);
          dismissLoading();
        } else {
          EasyLoading.showError('Error signing out');
        }
      }
    });
  }
}
