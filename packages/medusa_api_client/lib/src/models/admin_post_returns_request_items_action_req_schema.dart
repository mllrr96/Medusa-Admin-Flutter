/// AdminPostReturnsRequestItemsActionReqSchema
/// {
///     "properties": {
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "reason_id": {
///             "type": "string",
///             "description": "The ID of the associated return reason.",
///             "title": "reason_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The claim's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in the item."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_request_items_action_req_schema.freezed.dart';
part 'admin_post_returns_request_items_action_req_schema.g.dart'; // AdminPostReturnsRequestItemsActionReqSchema

@freezed
abstract class AdminPostReturnsRequestItemsActionReqSchema
    with _$AdminPostReturnsRequestItemsActionReqSchema {
  const AdminPostReturnsRequestItemsActionReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsRequestItemsActionReqSchema({
    /// quantity
    @JsonKey(name: AdminPostReturnsRequestItemsActionReqSchema.quantityKey)
    required double quantity,

    /// internalNote
    @JsonKey(name: AdminPostReturnsRequestItemsActionReqSchema.internalNoteKey)
    required String internalNote,

    /// reasonId
    @JsonKey(name: AdminPostReturnsRequestItemsActionReqSchema.reasonIdKey)
    required String reasonId,

    /// metadata
    @JsonKey(name: AdminPostReturnsRequestItemsActionReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostReturnsRequestItemsActionReqSchema;

  factory AdminPostReturnsRequestItemsActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsRequestItemsActionReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String internalNoteKey = r'internal_note';

  static const String reasonIdKey = r'reason_id';

  static const String metadataKey = r'metadata';
}
