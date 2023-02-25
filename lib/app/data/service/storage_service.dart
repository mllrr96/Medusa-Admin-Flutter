import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/enums.dart';
import '../../../core/utils/strings.dart';

class StorageService extends GetxService {
  static StorageService instance = Get.find<StorageService>();
  static String baseUrl = '${Get.find<StorageService>()._baseUrl}admin';

  late SharedPreferences _prefs;
  late String _baseUrl;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    _baseUrl = (_prefs.get('api') as String?) ?? 'https://server-test-production-02dd.up.railway.app/';
    return this;
  }

  AppearanceMode loadAppearance() {
    final appearance = _prefs.get('theme');
    if (appearance == null || appearance == 0) {
      return AppearanceMode.device;
    } else if (appearance == 1) {
      return AppearanceMode.light;
    } else {
      return AppearanceMode.dark;
    }
  }

  Future<void> saveAppearance(AppearanceMode appearanceMode) async {
    switch (appearanceMode) {
      case AppearanceMode.device:
        await _prefs.setInt('theme', 0);
        break;
      case AppearanceMode.light:
        await _prefs.setInt('theme', 1);
        break;
      case AppearanceMode.dark:
        await _prefs.setInt('theme', 2);
        break;
    }
    ThemeService.instance.changeTheme(appearance: appearanceMode);
  }

  Future<bool> isFirstRun() async {
    bool firstCall;
    try {
      firstCall = _prefs.getBool(AppConstants.firstRun) ?? true;
    } on Exception {
      firstCall = true;
    }
    await _prefs.setBool(AppConstants.firstRun, false);
    return firstCall;
  }

  Future<void> resetFirstCall() async {
    try {
      await _prefs.remove(AppConstants.firstRun);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> updateUrl(String value) async {
    try {
      return await _prefs.setString('api', value);
    } on Exception {
      return false;
    }
  }
}
