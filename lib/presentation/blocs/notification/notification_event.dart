part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.resend(String id, String? to) = _Resend;
  const factory NotificationEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
}
