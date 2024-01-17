import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/data/service/storage_service.dart';

class AppSettingsController extends GetxController {
  late ThemeMode themeMode;
  bool? canCheckBiometrics;
  LocalAuthentication localAuthentication = getIt<LocalAuthentication>();
  @override
  void onInit() async {
    themeMode = StorageService.instance.loadThemeMode();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    canCheckBiometrics = await localAuthentication.canCheckBiometrics || await localAuthentication.isDeviceSupported();
    update();
    super.onReady();
  }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    this.themeMode = themeMode;
    update();
    Future.delayed(const Duration(milliseconds: 250), () {
      StorageService.instance.saveThemeMode(themeMode);
    });
  }
}
