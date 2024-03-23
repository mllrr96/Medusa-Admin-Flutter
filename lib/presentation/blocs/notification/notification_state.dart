part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.error(Failure failure) = _Error;
  const factory NotificationState.notification(Notification notification) = _Notification;
  const factory NotificationState.notifications(List<Notification> notifications, int count) = _Notifications;
}
