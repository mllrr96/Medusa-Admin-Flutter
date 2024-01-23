import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/data/models/app_update.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/domain/repositories/app_updater_repo.dart';

@LazySingleton(as: AppUpdaterRepo)
class AppUpdaterRepositoryImpl extends AppUpdaterRepo{
  AppUpdaterRepositoryImpl(this.dio, this.preferenceService);
  final Dio dio;
  final PreferenceService preferenceService;
  @override
  Future<AppUpdate?> loadLatestRelease() async {
    try {
      final response = await dio.get(AppConstants.githubReleasesLink);
      if(response.statusCode == 304 || response.statusCode == 200){
        final appUpdate = AppUpdate.fromJson(response.data[0]);
        preferenceService.setAppUpdate(appUpdate);
        return appUpdate;
      } else {
        return null;
      }
    } catch(error){
      print('error: $error');
      return null;
    }
  }

  @override
  Future<void> performUpdate() async {

  }

}