import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/data/models/app_update.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/domain/repositories/app_updater_repo.dart';

@LazySingleton(as: AppUpdaterRepo)
class AppUpdaterRepositoryImpl extends AppUpdaterRepo {
  AppUpdaterRepositoryImpl(this.dio, this.preferenceService);
  final Dio dio;
  final PreferenceService preferenceService;

  @override
  Future<AppUpdate?> loadLatestRelease() async {
    try {
      final response =
          await dio.get<List<dynamic>>(AppConstants.githubReleasesLink);

      if (response.statusCode == 200) {
        Map<String, dynamic>? appUpdateMap;
        if (PreferenceService.appSettingsGetter.downloadBeta) {
          appUpdateMap = response.data?.firstOrNull;
        } else {
          appUpdateMap = response.data
              ?.firstWhereOrNull((element) => element['prerelease'] == false);
        }
        if (appUpdateMap != null) {
          final appUpdate = AppUpdate.fromJson(appUpdateMap);
          preferenceService.setAppUpdate(appUpdate);
          return appUpdate;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  @override
  Future<void> performUpdate() async {}
}
