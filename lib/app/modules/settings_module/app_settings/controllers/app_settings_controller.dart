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
    this.themeMode = themeMode;
    update();
    Future.delayed(const Duration(milliseconds: 250), () {
      StorageService.instance.saveThemeMode(themeMode);
    });
  }
}
