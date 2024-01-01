import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/theme_service.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/extensions/flex_scheme_extension.dart';
import '../../../core/utils/strings.dart';
import '../../modules/medusa_search/controllers/medusa_search_controller.dart';
import '../models/app/settings.dart';

class StorageService extends GetxService {
  static StorageService get instance => Get.find<StorageService>();
  static String get baseUrl => Get.find<StorageService>()._baseUrl;
  static String get language => Get.find<StorageService>()._language;
  static String? get cookie => Get.find<StorageService>()._cookie;
  static PackageInfo get packageInfo => Get.find<StorageService>()._packageInfo;
  static List<SearchHistory> get searchHistory =>
      Get.find<StorageService>()._searchHistory;

  static AppSettings get appSettings => Get.find<StorageService>()._appSettings;
  static OrderSettings get orderSettings =>
      Get.find<StorageService>()._orderSettings;

  late SharedPreferences _prefs;
  late String _baseUrl;
  late PackageInfo _packageInfo;
  late String _language;
  late String? _cookie;
  late List<SearchHistory> _searchHistory;
  late AppSettings _appSettings;
  late OrderSettings _orderSettings;

  Future<StorageService> init() async {
    _prefs = getIt<SharedPreferences>();
    try {
      _cookie = _prefs.getString('medusa_admin_cookie');
      _language = _prefs.getString(AppConstants.languageKey) ??
          Get.deviceLocale?.languageCode ??
          'en';
      _baseUrl =
          _prefs.getString(AppConstants.baseUrlKey) ?? AppConstants.baseUrl;
      _packageInfo = await PackageInfo.fromPlatform();
      final appSettingsCoded = _prefs.getString(AppConstants.appSettingsKey);
      if (appSettingsCoded != null) {
        _appSettings = AppSettings.fromJson(jsonDecode(appSettingsCoded));
      } else {
        _appSettings = AppSettings.defaultSettings()
            .copyWith(colorScheme: RandomFlexScheme.random());
        updateAppSettings(_appSettings);
      }

      final orderSettingsCoded =
          _prefs.getString(AppConstants.orderSettingsKey);
      if (orderSettingsCoded != null) {
        _orderSettings = OrderSettings.fromJson(jsonDecode(orderSettingsCoded));
      } else {
        _orderSettings = OrderSettings.defaultSettings();
      }

      final String? searchHistoryString =
          _prefs.getString(AppConstants.searchHistoryKey);
      if (searchHistoryString != null && searchHistoryString.isNotEmpty) {
        _searchHistory = SearchHistory.decode(searchHistoryString);
      } else {
        _searchHistory = [];
      }
    } catch (e) {
      debugPrint(e.toString());
      _cookie = null;
      _language = 'en';
      _appSettings = AppSettings.defaultSettings();
      _orderSettings = OrderSettings.defaultSettings();
      _searchHistory = [];
      _baseUrl = AppConstants.baseUrl;
      _packageInfo = PackageInfo(
          appName: '', packageName: '', version: '', buildNumber: '');
    }

    return this;
  }

  Future<bool> updateAppSettings(AppSettings appSettings) async {
    try {
      _prefs.setString(
          AppConstants.appSettingsKey, jsonEncode(appSettings.toJson()));
      _appSettings = appSettings;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> updateOrderSettings(OrderSettings orderSettings) async {
    try {
      _prefs.setString(
          AppConstants.orderSettingsKey, jsonEncode(orderSettings.toJson()));
      _orderSettings = orderSettings;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  ThemeMode loadThemeMode() {
    try {
      final themeMode = _prefs.getInt(AppConstants.themeModeKey);
      switch (themeMode) {
        case null:
        case 0:
          return ThemeMode.system;
        case 1:
          return ThemeMode.light;
        case 2:
          return ThemeMode.dark;
        default:
          return ThemeMode.system;
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeMode.system;
    }
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    try {
      await _prefs.setInt(AppConstants.themeModeKey, themeMode.value());
      ThemeController.instance.update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveLanguage(String language) async {
    try {
      await _prefs.setString(AppConstants.languageKey, language);
      ThemeController.instance.update();
    } catch (e) {
      debugPrint(e.toString());
    }
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
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> updateUrl(String value) async {
    try {
      return await _prefs.setString(AppConstants.baseUrlKey, value);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> clearCookie() async {
    try {
      _cookie = null;
      await _prefs.remove(AppConstants.cookieKey);
    } catch (e) {
      _cookie = null;
      debugPrint(e.toString());
    }
  }

  Future<void> saveCookie(String cookie) async {
    try {
      _cookie = cookie;
      await _prefs.setString(AppConstants.cookieKey, cookie);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateSearchHistory(SearchHistory searchHistory,
      {bool delete = false}) async {
    try {
      if (!delete &&
          _searchHistory
              .where((element) =>
                  element.text == searchHistory.text &&
                  element.searchableFields == searchHistory.searchableFields)
              .isNotEmpty) {
        return;
      }

      if (delete) {
        _searchHistory.removeWhere((element) =>
            element.text == searchHistory.text &&
            element.searchableFields.index ==
                searchHistory.searchableFields.index);
      } else {
        // Limiting search history to 7 items only
        if (_searchHistory.length > 7) {
          _searchHistory.removeAt(0);
        }
        _searchHistory.add(searchHistory);
      }
      await _prefs.setString(
          AppConstants.searchHistoryKey, SearchHistory.encode(_searchHistory));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Locale loadLocale() {
    try {
      final locale = _prefs.getString(AppConstants.languageKey);
      if (locale?.isNotEmpty ?? false) {
        return Locale(locale!);
      }
      return Get.deviceLocale ?? const Locale('en', 'US');
    } catch (e) {
      debugPrint(e.toString());
      return Get.deviceLocale ?? const Locale('en', 'US');
    }
  }
}
