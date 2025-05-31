/// AdminPostReturnsDismissItemsActionReqSchema
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
///     "description": "The details to update of the damaged item."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_dismiss_items_action_req_schema.freezed.dart';
part 'admin_post_returns_dismiss_items_action_req_schema.g.dart'; // AdminPostReturnsDismissItemsActionReqSchema

@freezed
abstract class AdminPostReturnsDismissItemsActionReqSchema
    with _$AdminPostReturnsDismissItemsActionReqSchema {
  const AdminPostReturnsDismissItemsActionReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsDismissItemsActionReqSchema({
    /// quantity
    @JsonKey(name: AdminPostReturnsDismissItemsActionReqSchema.quantityKey)
    required double quantity,

    /// internalNote
    @JsonKey(name: AdminPostReturnsDismissItemsActionReqSchema.internalNoteKey)
    required String internalNote,
  }) = _AdminPostReturnsDismissItemsActionReqSchema;

  factory AdminPostReturnsDismissItemsActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsDismissItemsActionReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String internalNoteKey = r'internal_note';
}
