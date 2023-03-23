import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/repository/auth/auth_repo.dart';
import '../../../data/service/storage_service.dart';
import '../../../routes/app_pages.dart';
import '../../components/easy_loading.dart';

class MoreController extends GetxController{
  MoreController({required this.authRepo});
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