/// AdminPostClaimsItemsActionReqSchema
/// {
///     "properties": {
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "reason_id": {
///             "type": "string",
///             "description": "The ID of the return reason associated with the item.",
///             "title": "reason_id"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note that's only viewed by admin users.",
///             "title": "internal_note"
///         }
///     },
///     "type": "object",
///     "description": "The details to update in the item."
/// }
library;

import 'exports.dart';
part 'admin_post_claims_items_action_req_schema.freezed.dart';
part 'admin_post_claims_items_action_req_schema.g.dart'; // AdminPostClaimsItemsActionReqSchema

@freezed
abstract class AdminPostClaimsItemsActionReqSchema
    with _$AdminPostClaimsItemsActionReqSchema {
  const AdminPostClaimsItemsActionReqSchema._();

  @jsonSerializable
  const factory AdminPostClaimsItemsActionReqSchema({
    /// quantity
    @JsonKey(name: AdminPostClaimsItemsActionReqSchema.quantityKey)
    required double quantity,

    /// reasonId
    @JsonKey(name: AdminPostClaimsItemsActionReqSchema.reasonIdKey)
    required String reasonId,

    /// internalNote
    @JsonKey(name: AdminPostClaimsItemsActionReqSchema.internalNoteKey)
    required String internalNote,
  }) = _AdminPostClaimsItemsActionReqSchema;

  factory AdminPostClaimsItemsActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostClaimsItemsActionReqSchemaFromJson(json);

  static const String quantityKey = r'quantity';

  static const String reasonIdKey = r'reason_id';

  static const String internalNoteKey = r'internal_note';
}
