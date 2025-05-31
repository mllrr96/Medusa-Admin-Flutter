/// AdminNotification
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The notification's ID.",
///             "title": "id"
///         },
///         "to": {
///             "type": "string",
///             "description": "Where to send the notification to. For example, if `channel` is `email`, this can be an email number.",
///             "title": "to"
///         },
///         "channel": {
///             "type": "string",
///             "description": "Through which channel is the notification sent through.",
///             "title": "channel"
///         },
///         "template": {
///             "type": "string",
///             "description": "The ID of the template in a third-party service used as the notification's shape.",
///             "title": "template"
///         },
///         "data": {
///             "type": "object",
///             "description": "Data payload to send with the notification."
///         },
///         "trigger_type": {
///             "type": "string",
///             "description": "What triggered this notification.",
///             "title": "trigger_type"
///         },
///         "resource_id": {
///             "type": "string",
///             "description": "The ID of the associated resource. For example, if the notification was triggered because an order was created, this would be the ID of the order.",
///             "title": "resource_id"
///         },
///         "resource_type": {
///             "type": "string",
///             "description": "The type of the resource that triggered the notification.",
///             "title": "resource_type"
///         },
///         "receiver_id": {
///             "type": "string",
///             "description": "The ID of the user or customer that's receiving this notification.",
///             "title": "receiver_id"
///         },
///         "original_notification_id": {
///             "type": "string",
///             "description": "The ID of the original notification, if this notification is resent.",
///             "title": "original_notification_id"
///         },
///         "external_id": {
///             "type": "string",
///             "description": "The ID of the notification in an external or third-party system.",
///             "title": "external_id"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the provider used to send the notification.",
///             "title": "provider_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the notification was created.",
///             "title": "created_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "to",
///         "channel",
///         "template",
///         "provider_id",
///         "created_at"
///     ],
///     "description": "The notification's details."
/// }
library admin_notification;

import 'exports.dart';
part 'admin_notification.freezed.dart';
part 'admin_notification.g.dart'; // AdminNotification

@freezed
abstract class AdminNotification with _$AdminNotification {
  const AdminNotification._();

  @jsonSerializable
  const factory AdminNotification({
    /// id
    @JsonKey(name: AdminNotification.idKey) required String id,

    /// to
    @JsonKey(name: AdminNotification.toKey) required String to,

    /// channel
    @JsonKey(name: AdminNotification.channelKey) required String channel,

    /// template
    @JsonKey(name: AdminNotification.templateKey) required String template,

    /// data
    @JsonKey(name: AdminNotification.dataKey)
    required Map<String, dynamic> data,

    /// triggerType
    @JsonKey(name: AdminNotification.triggerTypeKey)
    required String triggerType,

    /// resourceId
    @JsonKey(name: AdminNotification.resourceIdKey) required String resourceId,

    /// resourceType
    @JsonKey(name: AdminNotification.resourceTypeKey)
    required String resourceType,

    /// receiverId
    @JsonKey(name: AdminNotification.receiverIdKey) required String receiverId,

    /// originalNotificationId
    @JsonKey(name: AdminNotification.originalNotificationIdKey)
    required String originalNotificationId,

    /// externalId
    @JsonKey(name: AdminNotification.externalIdKey) required String externalId,

    /// providerId
    @JsonKey(name: AdminNotification.providerIdKey) required String providerId,

    /// createdAt
    @JsonKey(name: AdminNotification.createdAtKey) required DateTime createdAt,
  }) = _AdminNotification;

  factory AdminNotification.fromJson(Map<String, dynamic> json) =>
      _$AdminNotificationFromJson(json);

  static const String idKey = r'id';

  static const String toKey = r'to';

  static const String channelKey = r'channel';

  static const String templateKey = r'template';

  static const String dataKey = r'data';

  static const String triggerTypeKey = r'trigger_type';

  static const String resourceIdKey = r'resource_id';

  static const String resourceTypeKey = r'resource_type';

  static const String receiverIdKey = r'receiver_id';

  static const String originalNotificationIdKey = r'original_notification_id';

  static const String externalIdKey = r'external_id';

  static const String providerIdKey = r'provider_id';

  static const String createdAtKey = r'created_at';
}
