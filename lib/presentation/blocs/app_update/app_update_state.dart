part of 'app_update_bloc.dart';

@freezed
class AppUpdateState with _$AppUpdateState {
  const factory AppUpdateState.initial() = _Initial;
  const factory AppUpdateState.loading() = _Loading;
  const factory AppUpdateState.noUpdateAvailable() = _NoUpdateAvailable;
  const factory AppUpdateState.error(Failure failure) = _Error;
  const factory AppUpdateState.updateAvailable(AppUpdate appUpdate) = _UpdateAvailable;
}
