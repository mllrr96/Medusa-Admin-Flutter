/// AdminNotificationResponse
/// {
///     "properties": {
///         "notification": {
///             "$ref": "#/components/schemas/AdminNotification"
///         }
///     },
///     "type": "object",
///     "required": [
///         "notification"
///     ],
///     "description": "The notification's details."
/// }
library;

import 'exports.dart';
part 'admin_notification_response.freezed.dart';
part 'admin_notification_response.g.dart'; // AdminNotificationResponse

@freezed
abstract class AdminNotificationResponse with _$AdminNotificationResponse {
  const AdminNotificationResponse._();

  @jsonSerializable
  const factory AdminNotificationResponse({
    /// notification
    @JsonKey(name: AdminNotificationResponse.notificationKey)
    required AdminNotification notification,
  }) = _AdminNotificationResponse;

  factory AdminNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminNotificationResponseFromJson(json);

  static const String notificationKey = r'notification';
}
