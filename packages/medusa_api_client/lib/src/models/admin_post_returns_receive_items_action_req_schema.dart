/// AdminPostReturnsReceiveItemsActionReqSchema
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
///         }
///     },
///     "type": "object",
///     "description": "The details of the received item."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_receive_items_action_req_schema.freezed.dart';
part 'admin_post_returns_receive_items_action_req_schema.g.dart'; // AdminPostReturnsReceiveItemsActionReqSchema

@freezed
abstract class AdminPostReturnsReceiveItemsActionReqSchema
    with _$AdminPostReturnsReceiveItemsActionReqSchema {
  const AdminPostReturnsReceiveItemsActionReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsReceiveItemsActionReqSchema({
    /// quantity
    @JsonKey(name: AdminPostReturnsReceiveItemsActionReqSchema.quantityKey)
    required double quantity,

    /// internalNote
    @JsonKey(name: AdminPostReturnsReceiveItemsActionReqSchema.internalNoteKey)
    required String internalNote,
  }) = _AdminPostReturnsReceiveItemsActionReqSchema;

  factory AdminPostReturnsReceiveItemsActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsReceiveItemsActionReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String internalNoteKey = r'internal_note';
}
