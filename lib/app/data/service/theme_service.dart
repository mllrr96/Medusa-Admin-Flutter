import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';

class ThemeService extends GetxService {
  static ThemeService instance = Get.find<ThemeService>();
  late ThemeMode themeMode;


  Future<ThemeService> init() async {

    Get.changeThemeMode(StorageService.instance.loadThemeMode());

    return this;
  }

  // void _loadThemeMode() {
  //   switch (appearanceMode) {
  //     case AppearanceMode.device:
  //       themeMode = ThemeMode.system;
  //       break;
  //     case AppearanceMode.light:
  //       themeMode = ThemeMode.light;
  //       break;
  //     case AppearanceMode.dark:
  //       themeMode = ThemeMode.dark;
  //       break;
  //   }
  //   // update();
  // }
  //
  // void changeTheme({required AppearanceMode appearance}) {
  //   switch (appearance) {
  //     case AppearanceMode.device:
  //       Get.changeThemeMode(ThemeMode.system);
  //       break;
  //     case AppearanceMode.light:
  //       Get.changeThemeMode(ThemeMode.light);
  //       break;
  //     case AppearanceMode.dark:
  //       Get.changeThemeMode(ThemeMode.dark);
  //       break;
  //   }
  //   appearanceMode = appearance;
  //   // update();
  // }
}
