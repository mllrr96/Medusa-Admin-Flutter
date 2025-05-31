/// AdminPostReturnsReqSchema
/// {
///     "properties": {
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order the return belongs to.",
///             "title": "order_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location the items are returned to.",
///             "title": "location_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The return's description.",
///             "title": "description"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether to send the customer a notification about the created return.",
///             "title": "no_notification"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The return's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_id"
///     ],
///     "description": "The return's details."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_req_schema.freezed.dart';
part 'admin_post_returns_req_schema.g.dart'; // AdminPostReturnsReqSchema

@freezed
abstract class AdminPostReturnsReqSchema with _$AdminPostReturnsReqSchema {
  const AdminPostReturnsReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsReqSchema({
    /// orderId
    @JsonKey(name: AdminPostReturnsReqSchema.orderIdKey)
    required String orderId,

    /// locationId
    @JsonKey(name: AdminPostReturnsReqSchema.locationIdKey)
    required String locationId,

    /// description
    @JsonKey(name: AdminPostReturnsReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostReturnsReqSchema.internalNoteKey)
    required String internalNote,

    /// noNotification
    @JsonKey(name: AdminPostReturnsReqSchema.noNotificationKey)
    required bool noNotification,

    /// metadata
    @JsonKey(name: AdminPostReturnsReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostReturnsReqSchema;

  factory AdminPostReturnsReqSchema.fromJson(Map<String, dynamic> json) =>
      _$AdminPostReturnsReqSchemaFromJson(json);

  static const String orderIdKey = r'order_id';

  static const String locationIdKey = r'location_id';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String noNotificationKey = r'no_notification';

  static const String metadataKey = r'metadata';
}
