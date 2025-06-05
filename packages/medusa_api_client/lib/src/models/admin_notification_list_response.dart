/// AdminNotificationListResponse
/// {
///     "properties": {
///         "limit": {
///             "type": "number",
///             "description": "The maximum number of items returned.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items skipped before retrieving the returned items.",
///             "title": "offset"
///         },
///         "count": {
///             "type": "number",
///             "description": "The total count of items.",
///             "title": "count"
///         },
///         "notifications": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminNotification"
///             },
///             "description": "The list of notifications."
///         },
///         "estimate_count": {
///             "type": "number",
///             "description": "The estimated count retrieved from the PostgreSQL query planner, which may be inaccurate.",
///             "title": "estimate_count"
///         }
///     },
///     "type": "object",
///     "required": [
///         "limit",
///         "offset",
///         "count",
///         "notifications"
///     ],
///     "description": "The paginated list of notifications."
/// }
library;

import 'exports.dart';
part 'admin_notification_list_response.freezed.dart';
part 'admin_notification_list_response.g.dart'; // AdminNotificationListResponse

@freezed
abstract class AdminNotificationListResponse
    with _$AdminNotificationListResponse {
  const AdminNotificationListResponse._();

  @jsonSerializable
  const factory AdminNotificationListResponse({
    /// limit
    @JsonKey(name: AdminNotificationListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: AdminNotificationListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminNotificationListResponse.countKey)
    required int count,

    /// notifications
    @JsonKey(name: AdminNotificationListResponse.notificationsKey)
    required List<AdminNotification> notifications,

    /// estimateCount
    @JsonKey(name: AdminNotificationListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminNotificationListResponse;

  factory AdminNotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminNotificationListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String notificationsKey = r'notifications';

  static const String estimateCountKey = r'estimate_count';
}
