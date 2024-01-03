import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterCoreDependencies {
  @singleton
  final AppRouter appRouter = AppRouter();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  MedusaAdmin getService(
          StorageService storageService, SharedPreferences sharedPreferences) =>
      MedusaAdmin.initialize(
        prefs: sharedPreferences,
        config: MedusaConfig(
          baseUrl: StorageService.baseUrl,
          enableDebugging: true,
        ),
      );
}
