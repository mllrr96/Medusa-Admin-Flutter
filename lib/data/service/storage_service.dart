import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/service/theme_service.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/presentation/modules/medusa_search/controllers/medusa_search_controller.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
import '../../../core/constant/strings.dart';
import '../models/app/settings.dart';

@singleton
class StorageService {
  StorageService(SharedPreferences prefs) : _prefs = prefs;
  static StorageService get instance => getIt<StorageService>();
  static String? get baseUrl => instance._baseUrl;
  static String get language => instance._language;
  static String? get email => instance._email;
  String? get cookie {
    try {
      return _prefs.getString(AppConstants.cookieKey);
    } catch (_) {
      return null;
    }
  }

  static PackageInfo get packageInfo => instance._packageInfo;
  static List<SearchHistory> get searchHistory => instance._searchHistory;

  static AppSettings get appSettings => instance._appSettings;
  static OrderSettings get orderSettings => instance._orderSettings;
  final SharedPreferences _prefs;
  late String? _baseUrl;
  late PackageInfo _packageInfo;
  late String _language;
  late String? _email;
  late List<SearchHistory> _searchHistory;
  late AppSettings _appSettings;
  late OrderSettings _orderSettings;
  @PostConstruct()
  void init() async {
    try {
      _language = _prefs.getString(AppConstants.languageKey) ??
          Get.deviceLocale?.languageCode ??
          'en';
      _baseUrl = _prefs.getString(AppConstants.baseUrlKey) ??
          (AppConstants.baseUrl.isEmpty ? null : AppConstants.baseUrl);
      _email = _prefs.getString(AppConstants.emailKey);
      _packageInfo = getIt<PackageInfo>();
      final appSettingsCoded = _prefs.getString(AppConstants.appSettingsKey);
      if (appSettingsCoded != null) {
        _appSettings = AppSettings.fromJson(jsonDecode(appSettingsCoded));
      } else {
        _appSettings = AppSettings.defaultSettings()
            .copyWith(colorScheme: FlexScheme.indigo);
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
      _language = 'en';
      _appSettings = AppSettings.defaultSettings()
          .copyWith(colorScheme: FlexScheme.indigo);
      _orderSettings = OrderSettings.defaultSettings();
      _searchHistory = [];
      _baseUrl = AppConstants.baseUrl.isEmpty ? null : AppConstants.baseUrl;
      _packageInfo = PackageInfo(
          appName: '', packageName: '', version: '', buildNumber: '');
    }
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

  bool isAuthenticated() {
    try {
      return _prefs.getString(AppConstants.cookieKey) != null ? true : false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> saveLoginData(String email, String password) async {
    try {
      await _prefs.setString(AppConstants.emailKey, email);
      _email = email;
      await getIt<FlutterSecureStorage>()
          .write(key: AppConstants.passwordKey, value: password);
      await updateAppSettings(appSettings.copyWith(useBiometric: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> disableBiometricAuth() async {
    final useBiometric = appSettings.useBiometric;
    try {
      if (useBiometric == true) {
        await getIt<FlutterSecureStorage>()
            .delete(key: AppConstants.passwordKey);
        await updateAppSettings(appSettings.copyWith(useBiometric: false));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearLoginData() async {
    try {
      await getIt<FlutterSecureStorage>().delete(key: AppConstants.passwordKey);
      await updateAppSettings(appSettings.copyWith(resetBiometric: true));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setEmail(String email) async {
    try {
      await _prefs.setString(AppConstants.emailKey, email);
      _email = email;
    } catch (_) {}
  }

  Future<void> clearEmail() async {
    try {
      await _prefs.remove(AppConstants.emailKey);
      _email = null;
    } catch (_) {}
  }

  Future<Result<(String, String), String>> loadLoginData() async {
    try {
      final auth = getIt<LocalAuthentication>();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      if (!canAuthenticate) {
        return const Error('Device does not support biometric authentication');
      }
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to sign in to Medusa Admin');
      if (didAuthenticate) {
        return Success((
          _prefs.getString(AppConstants.emailKey) ?? '',
          await getIt<FlutterSecureStorage>()
                  .read(key: AppConstants.passwordKey) ??
              ''
        ));
      } else {
        return const Error('Biometric authentication failed');
      }
    } catch (error, stack) {
      log(error.toString());
      log(stack.toString());
      return const Error('Biometric authentication failed, try again later');
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

  Future<bool> updateUrl(String value) async {
    try {
      _baseUrl = value;
      return await _prefs.setString(AppConstants.baseUrlKey, value);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> clearCookie() async {
    try {
      await _prefs.remove(AppConstants.cookieKey);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearExportFiles() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      await Directory('${dir.path}/exports').delete(recursive: true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveCookie(String cookie) async {
    try {
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

  // -------------------------------------------------------------//
  bool? _isFirstRun;

  /// Returns true if this is the first time you call this method
  /// since installing the app, otherwise false.
  ///
  /// In contrast to [IsFirstRun.isFirstCall()], this method continues
  /// to return true as long as the app keeps running after the first call after installing the app,
  /// while [IsFirstRun.isFirstCall()] returns true only on the first call after installing the app.
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

  bool? _isSignedInBefore;

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
}
