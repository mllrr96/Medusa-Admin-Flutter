/// AdminPostClaimsShippingActionReqSchema
/// {
///     "properties": {
///         "custom_amount": {
///             "type": "number",
///             "description": "The shipping method's custom amount.",
///             "title": "custom_amount"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note only viewed by admin users.",
///             "title": "internal_note"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The claim's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in the shipping method."
/// }
library;

import 'exports.dart';
part 'admin_post_claims_shipping_action_req_schema.freezed.dart';
part 'admin_post_claims_shipping_action_req_schema.g.dart'; // AdminPostClaimsShippingActionReqSchema

@freezed
abstract class AdminPostClaimsShippingActionReqSchema
    with _$AdminPostClaimsShippingActionReqSchema {
  const AdminPostClaimsShippingActionReqSchema._();

  @jsonSerializable
  const factory AdminPostClaimsShippingActionReqSchema({
    /// customAmount
    @JsonKey(name: AdminPostClaimsShippingActionReqSchema.customAmountKey)
    required double customAmount,

    /// internalNote
    @JsonKey(name: AdminPostClaimsShippingActionReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostClaimsShippingActionReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostClaimsShippingActionReqSchema;

  factory AdminPostClaimsShippingActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostClaimsShippingActionReqSchemaFromJson(json);

  static const String customAmountKey = r'custom_amount';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
