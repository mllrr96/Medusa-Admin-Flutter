/// AdminPostExchangesShippingReqSchema
/// {
///     "properties": {
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping option.",
///             "title": "shipping_option_id"
///         },
///         "custom_amount": {
///             "type": "number",
///             "description": "Set a custom amount for the shipping method.",
///             "title": "custom_amount"
///         },
///         "description": {
///             "type": "string",
///             "description": "The shipping method's description.",
///             "title": "description"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed by admin users only.",
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
///     "description": "The outbound shipping method's details."
/// }
library;

import 'exports.dart';
part 'admin_post_exchanges_shipping_req_schema.freezed.dart';
part 'admin_post_exchanges_shipping_req_schema.g.dart'; // AdminPostExchangesShippingReqSchema

@freezed
abstract class AdminPostExchangesShippingReqSchema
    with _$AdminPostExchangesShippingReqSchema {
  const AdminPostExchangesShippingReqSchema._();

  @jsonSerializable
  const factory AdminPostExchangesShippingReqSchema({
    /// shippingOptionId
    @JsonKey(name: AdminPostExchangesShippingReqSchema.shippingOptionIdKey)
    required String shippingOptionId,

    /// customAmount
    @JsonKey(name: AdminPostExchangesShippingReqSchema.customAmountKey)
    required double customAmount,

    /// description
    @JsonKey(name: AdminPostExchangesShippingReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostExchangesShippingReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostExchangesShippingReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostExchangesShippingReqSchema;

  factory AdminPostExchangesShippingReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostExchangesShippingReqSchemaFromJson(json);

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String customAmountKey = r'custom_amount';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
