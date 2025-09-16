import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/constants/strings.dart';
import 'package:medusa_admin/src/core/utils/enums.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/features/auth/data/models/auth_preference.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AuthPreferenceService {
  AuthPreferenceService(
      SharedPreferences prefs, FlutterSecureStorage securePrefs)
      : _prefs = prefs,
        _securePrefs = securePrefs;
  static AuthPreferenceService get instance => getIt<AuthPreferenceService>();
  final SharedPreferences _prefs;
  final FlutterSecureStorage _securePrefs;

  static String? get baseUrlGetter => instance._baseUrl;
  static AuthenticationType get authTypeGetter =>
      instance._authPreference.authType;
  static AuthPreference get authPreferenceGetter => instance._authPreference;
  static String? get email => instance._email;
  static bool get isAuthenticatedGetter => instance._isAuthenticated;
  bool get isAuthenticated => _isAuthenticated;
  AuthPreference get authPreference => _authPreference;

  late bool _isAuthenticated;
  String? get baseUrl => _baseUrl;
  late String? _baseUrl;
  late String? _email;
  late AuthPreference _authPreference;
  bool? _isSignedInBefore;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    try {
      final authPreferenceCoded =
          _prefs.getString(AppConstants.authPreferenceKey);
      if (authPreferenceCoded != null) {
        _authPreference =
            AuthPreference.fromJson(jsonDecode(authPreferenceCoded));
      } else {
        _authPreference = AuthPreference.defaultSettings();
        updateAuthPreference(_authPreference);
      }
    } catch (e) {
      _authPreference = AuthPreference.defaultSettings();
    }

    try {
      _baseUrl = _prefs.getString(AppConstants.baseUrlKey) ??
          (AppConstants.baseUrl.isEmpty ? null : AppConstants.baseUrl);
      _email = _prefs.getString(AppConstants.emailKey);
      _isAuthenticated = await _isKeyStored();
    } catch (e) {
      debugPrint(e.toString());
      _baseUrl = AppConstants.baseUrl.isEmpty ? null : AppConstants.baseUrl;
      _email = null;
      _isAuthenticated = false;
    }
  }

  Future<bool> updateAuthPreference(AuthPreference authPreference) async {
    try {
      await _prefs.setString(
          AppConstants.authPreferenceKey, jsonEncode(authPreference.toJson()));
      _authPreference = authPreference;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> _isKeyStored() async {
    try {
      switch (_authPreference.authType) {
        case AuthenticationType.cookie:
          return await _securePrefs.containsKey(key: AppConstants.cookieKey);
        case AuthenticationType.jwt:
          return await _securePrefs.containsKey(key: AppConstants.jwtKey);
        case AuthenticationType.token:
          return await _securePrefs.containsKey(key: AppConstants.tokenKey);
      }
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
      await updateAuthPreference(_authPreference.copyWith(useBiometric: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> disableBiometricAuth() async {
    final useBiometric = _authPreference.useBiometric;
    try {
      if (useBiometric == true) {
        await getIt<FlutterSecureStorage>()
            .delete(key: AppConstants.passwordKey);
        await updateAuthPreference(
            _authPreference.copyWith(useBiometric: false));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearLoginData() async {
    try {
      await getIt<FlutterSecureStorage>().delete(key: AppConstants.passwordKey);
      await updateAuthPreference(
          _authPreference.copyWith(resetBiometric: true));
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

  Future<bool> updateUrl(String value) async {
    try {
      _baseUrl = value;
      return await _prefs.setString(AppConstants.baseUrlKey, value);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> clearLoginKey({bool excludeToken = false}) async {
    try {
      switch (_authPreference.authType) {
        case AuthenticationType.cookie:
          await _securePrefs.delete(key: AppConstants.cookieKey);
          break;
        case AuthenticationType.jwt:
          await _securePrefs.delete(key: AppConstants.jwtKey);
          break;
        case AuthenticationType.token:
          if (!excludeToken) {
            await _securePrefs.delete(key: AppConstants.tokenKey);
          }
          break;
      }
      _isAuthenticated = false;
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

  Future<void> clearUpdateFiles() async {
    try {
      Directory dir = await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory();
      await Directory(dir.path).delete(recursive: true);
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
      _isSignedInBefore ??= isSignedInBefore;
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

  void setIsAuthenticated(bool val) {
    _isAuthenticated = val;
  }
}
