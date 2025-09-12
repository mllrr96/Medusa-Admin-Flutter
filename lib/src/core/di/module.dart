import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/features/auth/data/service/auth_preference_service.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'medusa_admin_di.dart';

@module
abstract class RegisterCoreDependencies {
  @singleton
  AppRouter appRouter() => AppRouter();

  // @singleton
  // Dio dio() => Dio();

  @singleton
  FlutterSecureStorage securePrefs() => FlutterSecureStorage(aOptions: _getAndroidOptions());

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @singleton
  MedusaAdminV2 client(AuthPreferenceService authPreferenceService) => MedusaAdminV2.initialize(
        baseUrl: authPreferenceService.baseUrl,
        interceptors: [
          MedusaAdminDi.loggerInterceptor,
          MedusaAdminDi.authInterceptor,
          // MedusaAdminDi.contentTypeInterceptor,
        ],
      );
}

AndroidOptions _getAndroidOptions() => const AndroidOptions();
