/// AdminPostOrderEditsShippingActionReqSchema
/// {
///     "properties": {
///         "custom_amount": {
///             "type": "number",
///             "description": "Set a custom price for the shipping method.",
///             "title": "custom_amount"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The order edit's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The shipping method's details."
/// }
library;

import 'exports.dart';
part 'admin_post_order_edits_shipping_action_req_schema.freezed.dart';
part 'admin_post_order_edits_shipping_action_req_schema.g.dart'; // AdminPostOrderEditsShippingActionReqSchema

@freezed
abstract class AdminPostOrderEditsShippingActionReqSchema
    with _$AdminPostOrderEditsShippingActionReqSchema {
  const AdminPostOrderEditsShippingActionReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderEditsShippingActionReqSchema({
    /// customAmount
    @JsonKey(name: AdminPostOrderEditsShippingActionReqSchema.customAmountKey)
    required double customAmount,

    /// internalNote
    @JsonKey(name: AdminPostOrderEditsShippingActionReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostOrderEditsShippingActionReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostOrderEditsShippingActionReqSchema;

  factory AdminPostOrderEditsShippingActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostOrderEditsShippingActionReqSchemaFromJson(json);

  static const String customAmountKey = r'custom_amount';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
