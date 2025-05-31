/// AdminPostReturnsShippingActionReqSchema
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
///             "description": "The return's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The shipping method's details."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_shipping_action_req_schema.freezed.dart';
part 'admin_post_returns_shipping_action_req_schema.g.dart'; // AdminPostReturnsShippingActionReqSchema

@freezed
abstract class AdminPostReturnsShippingActionReqSchema
    with _$AdminPostReturnsShippingActionReqSchema {
  const AdminPostReturnsShippingActionReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsShippingActionReqSchema({
    /// customAmount
    @JsonKey(name: AdminPostReturnsShippingActionReqSchema.customAmountKey)
    required double customAmount,

    /// internalNote
    @JsonKey(name: AdminPostReturnsShippingActionReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostReturnsShippingActionReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostReturnsShippingActionReqSchema;

  factory AdminPostReturnsShippingActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsShippingActionReqSchemaFromJson(json);

  static const String customAmountKey = r'custom_amount';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
