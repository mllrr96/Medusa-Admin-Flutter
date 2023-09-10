import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/strings.dart';
import '../../modules/medusa_search/controllers/medusa_search_controller.dart';
import '../models/app/settings.dart';

class StorageService extends GetxService {
  static StorageService get instance => Get.find<StorageService>();
  static String get baseUrl => Get.find<StorageService>()._baseUrl;
  static String get language => Get.find<StorageService>()._language;
  static String? get cookie => Get.find<StorageService>()._cookie;
  static List<SearchHistory> get searchHistory =>
      Get.find<StorageService>()._searchHistory;

  static AppSettings get appSettings => Get.find<StorageService>()._appSettings;

  late SharedPreferences _prefs;
  late String _baseUrl;
  late String _language;
  late String? _cookie;
  late List<SearchHistory> _searchHistory;
  late AppSettings _appSettings;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    final String defaultLocale;
      defaultLocale = Platform.localeName.length == 2
          ? Platform.localeName
          : Platform.localeName.split('_')[0];

    try {
      _cookie = _prefs.getString(AppConstants.cookieKey);
      _language = _prefs.getString(AppConstants.languageKey) ?? defaultLocale;
      _baseUrl = _prefs.getString(AppConstants.baseUrlKey) ?? AppConstants.baseUrl;
      final appSettingsCoded = _prefs.getString(AppConstants.appSettingsKey);
      if(appSettingsCoded!=null){
        _appSettings = AppSettings.fromJson(
            jsonDecode(appSettingsCoded));
      } else {
        _appSettings = AppSettings();
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
      _language = defaultLocale;
      _appSettings = AppSettings();
      _searchHistory = [];
      _baseUrl = AppConstants.baseUrl;
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
      Get.changeThemeMode(themeMode);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveLanguage(String language) async {
    try {
      await _prefs.setString(AppConstants.languageKey, language);
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
}
