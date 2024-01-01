import 'package:injectable/injectable.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di.dart';

@module
abstract class RegisterCoreDependencies {
  @singleton
  final AppRouter appRouter = AppRouter();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  final MedusaAdmin medusaAdmin = MedusaAdmin.initialize(
    config: MedusaConfig(baseUrl: 'https://medusa-j2t9.onrender.com/admin'),
  );
}
