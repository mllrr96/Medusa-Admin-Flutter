/// AdminPostExchangesShippingActionReqSchema
/// {
///     "properties": {
///         "custom_amount": {
///             "type": "number",
///             "description": "The shipping method's custom amount.",
///             "title": "custom_amount"
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
///     "description": "The details of the shipping method to update."
/// }
library;

import 'exports.dart';
part 'admin_post_exchanges_shipping_action_req_schema.freezed.dart';
part 'admin_post_exchanges_shipping_action_req_schema.g.dart'; // AdminPostExchangesShippingActionReqSchema

@freezed
abstract class AdminPostExchangesShippingActionReqSchema
    with _$AdminPostExchangesShippingActionReqSchema {
  const AdminPostExchangesShippingActionReqSchema._();

  @jsonSerializable
  const factory AdminPostExchangesShippingActionReqSchema({
    /// customAmount
    @JsonKey(name: AdminPostExchangesShippingActionReqSchema.customAmountKey)
    required double customAmount,

    /// internalNote
    @JsonKey(name: AdminPostExchangesShippingActionReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostExchangesShippingActionReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostExchangesShippingActionReqSchema;

  factory AdminPostExchangesShippingActionReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostExchangesShippingActionReqSchemaFromJson(json);

  static const String customAmountKey = r'custom_amount';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
