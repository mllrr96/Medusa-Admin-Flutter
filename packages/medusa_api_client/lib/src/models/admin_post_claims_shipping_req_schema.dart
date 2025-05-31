/// AdminPostClaimsShippingReqSchema
/// {
///     "properties": {
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping option.",
///             "title": "shipping_option_id"
///         },
///         "custom_amount": {
///             "type": "number",
///             "description": "Set a custom price for the shipping method.",
///             "title": "custom_amount"
///         },
///         "description": {
///             "type": "string",
///             "description": "The shipping method's description.",
///             "title": "description"
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
///     "required": [
///         "shipping_option_id"
///     ],
///     "description": "The details of the shipping method used to ship outbound items."
/// }
library;

import 'exports.dart';
part 'admin_post_claims_shipping_req_schema.freezed.dart';
part 'admin_post_claims_shipping_req_schema.g.dart'; // AdminPostClaimsShippingReqSchema

@freezed
abstract class AdminPostClaimsShippingReqSchema
    with _$AdminPostClaimsShippingReqSchema {
  const AdminPostClaimsShippingReqSchema._();

  @jsonSerializable
  const factory AdminPostClaimsShippingReqSchema({
    /// shippingOptionId
    @JsonKey(name: AdminPostClaimsShippingReqSchema.shippingOptionIdKey)
    required String shippingOptionId,

    /// customAmount
    @JsonKey(name: AdminPostClaimsShippingReqSchema.customAmountKey)
    required double customAmount,

    /// description
    @JsonKey(name: AdminPostClaimsShippingReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostClaimsShippingReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostClaimsShippingReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostClaimsShippingReqSchema;

  factory AdminPostClaimsShippingReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostClaimsShippingReqSchemaFromJson(json);

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String customAmountKey = r'custom_amount';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
