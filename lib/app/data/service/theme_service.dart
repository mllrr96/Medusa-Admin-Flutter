import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';

import '../../../core/utils/enums.dart';

class ThemeService extends GetxController {
  static ThemeService instance = Get.find<ThemeService>();
  late ThemeMode themeMode;
  late AppearanceMode appearanceMode;

  @override
  void onInit() {
    super.onInit();
    appearanceMode = StorageService.instance.loadAppearance();
    _loadThemeMode();
  }

  void _loadThemeMode() {
    switch (appearanceMode) {
      case AppearanceMode.device:
        themeMode = ThemeMode.system;
        break;
      case AppearanceMode.light:
        themeMode = ThemeMode.light;
        break;
      case AppearanceMode.dark:
        themeMode = ThemeMode.dark;
        break;
    }
    update();
  }

  void changeTheme({required AppearanceMode appearance}) {
    switch (appearance) {
      case AppearanceMode.device:
        Get.changeThemeMode(ThemeMode.system);
        break;
      case AppearanceMode.light:
        Get.changeThemeMode(ThemeMode.light);
        break;
      case AppearanceMode.dark:
        Get.changeThemeMode(ThemeMode.dark);
        break;
    }
    appearanceMode = appearance;
    update();
  }
}
