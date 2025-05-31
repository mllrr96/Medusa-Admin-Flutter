/// AdminPostReturnsShippingReqSchema
/// {
///     "properties": {
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping option.",
///             "title": "shipping_option_id"
///         },
///         "custom_amount": {
///             "type": "number",
///             "description": "Set the price of the shipping method.",
///             "title": "custom_amount"
///         },
///         "description": {
///             "type": "string",
///             "description": "The shipping method's description.",
///             "title": "description"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The exchange's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "shipping_option_id"
///     ],
///     "description": "The shipping method's details."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_shipping_req_schema.freezed.dart';
part 'admin_post_returns_shipping_req_schema.g.dart'; // AdminPostReturnsShippingReqSchema

@freezed
abstract class AdminPostReturnsShippingReqSchema
    with _$AdminPostReturnsShippingReqSchema {
  const AdminPostReturnsShippingReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsShippingReqSchema({
    /// shippingOptionId
    @JsonKey(name: AdminPostReturnsShippingReqSchema.shippingOptionIdKey)
    required String shippingOptionId,

    /// customAmount
    @JsonKey(name: AdminPostReturnsShippingReqSchema.customAmountKey)
    required double customAmount,

    /// description
    @JsonKey(name: AdminPostReturnsShippingReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostReturnsShippingReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostReturnsShippingReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostReturnsShippingReqSchema;

  factory AdminPostReturnsShippingReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsShippingReqSchemaFromJson(json);

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String customAmountKey = r'custom_amount';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
