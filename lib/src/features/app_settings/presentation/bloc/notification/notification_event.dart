part of 'notification_bloc.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
}
