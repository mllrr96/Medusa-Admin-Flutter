/// AdminPostReturnsReturnReqSchema
/// {
///     "properties": {
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location to return items to.",
///             "title": "location_id"
///         },
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether the customer should receive notifications about updates to the return.",
///             "title": "no_notification"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The return's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The return's details."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_return_req_schema.freezed.dart';
part 'admin_post_returns_return_req_schema.g.dart'; // AdminPostReturnsReturnReqSchema

@freezed
abstract class AdminPostReturnsReturnReqSchema
    with _$AdminPostReturnsReturnReqSchema {
  const AdminPostReturnsReturnReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsReturnReqSchema({
    /// locationId
    @JsonKey(name: AdminPostReturnsReturnReqSchema.locationIdKey)
    required String locationId,

    /// noNotification
    @JsonKey(name: AdminPostReturnsReturnReqSchema.noNotificationKey)
    required bool noNotification,

    /// metadata
    @JsonKey(name: AdminPostReturnsReturnReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostReturnsReturnReqSchema;

  factory AdminPostReturnsReturnReqSchema.fromJson(Map<String, dynamic> json) =>
      _$AdminPostReturnsReturnReqSchemaFromJson(json);

  static const String locationIdKey = r'location_id';

  static const String noNotificationKey = r'no_notification';

  static const String metadataKey = r'metadata';
}
