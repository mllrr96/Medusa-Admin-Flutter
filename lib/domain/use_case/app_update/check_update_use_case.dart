import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/data/models/app_update.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class CheckUpdateUseCase {
  CheckUpdateUseCase(this.dio, this.packageInfo, this.preferenceService);
  static CheckUpdateUseCase get instance => getIt<CheckUpdateUseCase>();
  final Dio dio;
  final PackageInfo packageInfo;
  final PreferenceService preferenceService;

  Future<Result<AppUpdate?, Failure>> call() async {
    try {
      final response =
          await dio.get<List<dynamic>>(AppConstants.githubReleasesLink);

      if (response.statusCode == 200) {
        Map<String, dynamic>? appUpdateMap;
        if (preferenceService.appSettings.downloadBeta) {
          appUpdateMap = response.data?.firstOrNull;
        } else {
          appUpdateMap = response.data?.firstWhere(
              (element) => element['prerelease'] == false,
              orElse: () => null);
        }
        if (appUpdateMap != null && appUpdateMap['tag_name'] != null) {
          final appUpdate = AppUpdate.fromJson(appUpdateMap);
          final updateAvailable =
              appUpdate.tagName!.higherThan(packageInfo.version);
          if (updateAvailable) {
            return Success(appUpdate);
          } else {
            return const Success(null);
          }
        } else {
          return Error(Failure(message: 'Error parsing update', type: ''));
        }
      } else {
        return Error(Failure.from(response));
      }
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
