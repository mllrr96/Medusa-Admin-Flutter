/// AdminPostExchangesItemsActionReqSchema
/// {
///     "properties": {
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note only viewed by admin users.",
///             "title": "internal_note"
///         }
///     },
///     "type": "object",
///     "description": "The details to update in an outbound item."
/// }
library;

import 'exports.dart';
part 'admin_post_exchanges_items_action_req_schema.freezed.dart';
part 'admin_post_exchanges_items_action_req_schema.g.dart'; // AdminPostExchangesItemsActionReqSchema

@freezed
abstract class AdminPostExchangesItemsActionReqSchema
    with _$AdminPostExchangesItemsActionReqSchema {
  const AdminPostExchangesItemsActionReqSchema._();

  @jsonSerializable
  const factory AdminPostExchangesItemsActionReqSchema({
    /// quantity
    @JsonKey(name: AdminPostExchangesItemsActionReqSchema.quantityKey)
    required double quantity,

    /// internalNote
    @JsonKey(name: AdminPostExchangesItemsActionReqSchema.internalNoteKey)
    required String internalNote,
  }) = _AdminPostExchangesItemsActionReqSchema;

  factory AdminPostExchangesItemsActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostExchangesItemsActionReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String internalNoteKey = r'internal_note';
}
