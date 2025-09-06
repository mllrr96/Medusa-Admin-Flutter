import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/route/app_router.dart';
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
  MedusaAdminV2 get client => MedusaAdminV2.initialize(
        baseUrl: 'http://192.168.0.108:9000',
    interceptors: [
          MedusaAdminDi.loggerInterceptor,
          MedusaAdminDi.authInterceptor,
    ]
      );
}

AndroidOptions _getAndroidOptions() => const AndroidOptions();
