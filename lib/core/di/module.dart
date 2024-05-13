import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterCoreDependencies {
  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  Dio get dio => Dio();

  @singleton
  FlutterSecureStorage get securePrefs =>
      FlutterSecureStorage(aOptions: _getAndroidOptions());

  @preResolve
  Future<SharedPreferences> prefs() async =>
      await SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> packageInfo() async => await PackageInfo.fromPlatform();
}

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
