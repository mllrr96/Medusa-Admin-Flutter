import 'dart:convert';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/order_preference.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/presentation/modules/medusa_search/controllers/medusa_search_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/strings.dart';
import '../models/app_preference.dart';

@singleton
class PreferenceService {
  PreferenceService(SharedPreferences prefs, FlutterSecureStorage securePrefs)
      : _prefs = prefs;
  static PreferenceService get instance => getIt<PreferenceService>();
  final SharedPreferences _prefs;

  static String get language => instance._language;

  static PackageInfo get packageInfo => instance._packageInfo;
  static AppPreference get appSettingsGetter => instance._appSettings;
  AppPreference get appSettings => _appSettings;
  static OrderPreference get orderPreference => instance._orderPreference;
  static List<SearchHistory> get searchHistory => instance._searchHistory;
  static bool get checkedForUpdate => instance._checkedForUpdate;
  bool _checkedForUpdate = false;
  late PackageInfo _packageInfo;
  late String _language;
  late AppPreference _appSettings;
  late OrderPreference _orderPreference;
  late List<SearchHistory> _searchHistory;
  bool? _isFirstRun;
  bool? _isSignedInBefore;

  @PostConstruct()
  void init() {
    // Language
    try {
      _language = _prefs.getString(AppConstants.languageKey) ??
          Get.deviceLocale?.languageCode ??
          'en';
    } catch (e) {
      _language = 'en';
    }
    try {
      final String? searchHistoryString =
          _prefs.getString(AppConstants.searchHistoryKey);
      if (searchHistoryString != null && searchHistoryString.isNotEmpty) {
        _searchHistory = SearchHistory.decode(searchHistoryString);
      } else {
        _searchHistory = [];
      }
    } catch (e) {
      _searchHistory = [];
    }
    // Package info
    try {
      _packageInfo = getIt<PackageInfo>();
    } catch (e) {
      _packageInfo = PackageInfo(
          appName: '', packageName: '', version: '', buildNumber: '');
    }

    // App preferences
    try {
      final appSettingsCoded = _prefs.getString(AppConstants.appPreferenceKey);
      if (appSettingsCoded != null) {
        _appSettings = AppPreference.fromJson(jsonDecode(appSettingsCoded));
      } else {
        _appSettings = AppPreference.defaultSettings()
            .copyWith(colorScheme: FlexScheme.indigo);
        updateAppSettings(_appSettings);
      }
    } catch (e) {
      _appSettings = AppPreference.defaultSettings()
          .copyWith(colorScheme: FlexScheme.indigo);
    }

    // Orders preferences
    try {
      final orderSettingsCoded =
          _prefs.getString(AppConstants.orderSettingsKey);
      if (orderSettingsCoded != null) {
        _orderPreference =
            OrderPreference.fromJson(jsonDecode(orderSettingsCoded));
      } else {
        _orderPreference = OrderPreference.defaultSettings();
      }
    } catch (e) {
      _orderPreference = OrderPreference.defaultSettings();
    }
  }

  Future<bool> updateAppSettings(AppPreference appSettings) async {
    try {
      _prefs.setString(
          AppConstants.appPreferenceKey, jsonEncode(appSettings.toJson()));
      _appSettings = appSettings;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> updateOrderSettings(OrderPreference orderPreference) async {
    try {
      _prefs.setString(
          AppConstants.orderSettingsKey, jsonEncode(orderPreference.toJson()));
      _orderPreference = orderPreference;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }


  Future<void> saveLanguage(String language) async {
    try {
      await _prefs.setString(AppConstants.languageKey, language);
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

  Future<bool> isFirstRun() async {
    if (_isFirstRun != null) {
      return _isFirstRun!;
    } else {
      bool isFirstRun;
      try {
        isFirstRun = _prefs.getBool(AppConstants.firstRun) ?? true;
      } on Exception {
        isFirstRun = true;
      }
      await _prefs.setBool(AppConstants.firstRun, false);
      _isFirstRun ??= isFirstRun;
      return isFirstRun;
    }
  }

  Future<void> resetFirstRun() async {
    try {
      await _prefs.remove(AppConstants.firstRun);
      _isFirstRun = null;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> isSignedInBefore() async {
    if (_isSignedInBefore != null) {
      return _isSignedInBefore!;
    } else {
      bool isSignedInBefore;
      try {
        isSignedInBefore = _prefs.getBool(AppConstants.firstSignIn) ?? true;
      } on Exception {
        isSignedInBefore = true;
      }
      await _prefs.setBool(AppConstants.firstSignIn, false);
      _isFirstRun ??= isSignedInBefore;
      return isSignedInBefore;
    }
  }

  Future<void> resetSignedBefore() async {
    try {
      await _prefs.remove(AppConstants.firstSignIn);
      _isSignedInBefore = null;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setCheckedForUpdate(bool val) => _checkedForUpdate = val;

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
