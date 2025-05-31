/// AdminPostOrderEditsShippingReqSchema
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
///             "description": "A note viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The shipping method's metadata, can hold custom key-value pairs."
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
part 'admin_post_order_edits_shipping_req_schema.freezed.dart';
part 'admin_post_order_edits_shipping_req_schema.g.dart'; // AdminPostOrderEditsShippingReqSchema

@freezed
abstract class AdminPostOrderEditsShippingReqSchema
    with _$AdminPostOrderEditsShippingReqSchema {
  const AdminPostOrderEditsShippingReqSchema._();

  @jsonSerializable
  const factory AdminPostOrderEditsShippingReqSchema({
    /// shippingOptionId
    @JsonKey(name: AdminPostOrderEditsShippingReqSchema.shippingOptionIdKey)
    required String shippingOptionId,

    /// customAmount
    @JsonKey(name: AdminPostOrderEditsShippingReqSchema.customAmountKey)
    required double customAmount,

    /// description
    @JsonKey(name: AdminPostOrderEditsShippingReqSchema.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminPostOrderEditsShippingReqSchema.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminPostOrderEditsShippingReqSchema.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminPostOrderEditsShippingReqSchema;

  factory AdminPostOrderEditsShippingReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostOrderEditsShippingReqSchemaFromJson(json);

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String customAmountKey = r'custom_amount';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
