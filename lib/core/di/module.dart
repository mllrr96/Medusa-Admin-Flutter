import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterCoreDependencies {
  @singleton
  final AppRouter appRouter = AppRouter();

  @singleton
  final LocalAuthentication auth = LocalAuthentication();

  @singleton
  final FlutterSecureStorage securePrefs =
      FlutterSecureStorage(aOptions: _getAndroidOptions());

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
