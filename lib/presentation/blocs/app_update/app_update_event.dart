part of 'app_update_bloc.dart';

@freezed
class AppUpdateEvent with _$AppUpdateEvent {
  const factory AppUpdateEvent.checkForUpdate() = _CheckForUpdate;
  const factory AppUpdateEvent.performUpdate() = _PerformUpdate;
}
