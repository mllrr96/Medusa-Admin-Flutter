import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/service/storage_service.dart';

class AppSettingsController extends GetxController {
  late ThemeMode themeMode;

  @override
  void onInit() {
    themeMode = StorageService.instance.loadThemeMode();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    await StorageService.instance.saveThemeMode(themeMode);
    this.themeMode = themeMode;
    update();
  }
}
