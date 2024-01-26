import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/data/models/app_update.dart';

abstract class AppUpdaterRepo {
  static AppUpdaterRepo instance = getIt<AppUpdaterRepo>();
  Future<AppUpdate?> loadLatestRelease();
  Future<void> performUpdate();
}