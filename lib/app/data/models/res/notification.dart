import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/notification.dart';

class UserRetrieveNotificationsRes extends PaginatedResponse {
  List<Notification>? notifications;

  UserRetrieveNotificationsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['notifications'] == null) return;
    notifications = <Notification>[];
    json['notifications'].forEach((v) => notifications!.add(Notification.fromJson(v)));
  }
}

class UserNotificationsRes {
  final Notification? notification;

  UserNotificationsRes(this.notification);

  factory UserNotificationsRes.fromJson(Map<String, dynamic> json) {
    return UserNotificationsRes(json['notification'] != null ? Notification.fromJson(json['notification']) : null);
  }
}
