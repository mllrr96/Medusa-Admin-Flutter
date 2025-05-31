/// AdminAddDraftOrderShippingMethod
/// {
///     "properties": {
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option that this method is created from.",
///             "title": "shipping_option_id"
///         },
///         "custom_amount": {
///             "type": "number",
///             "description": "A custom amount to be charged for this shipping method. If not provided, the shipping option's amount will be used.",
///             "title": "custom_amount"
///         },
///         "description": {
///             "type": "string",
///             "description": "The shipping method's description.",
///             "title": "description"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users about the shipping method.",
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
///     "description": "The details of the shipping method to add to a draft order."
/// }
library;

import 'exports.dart';
part 'admin_add_draft_order_shipping_method.freezed.dart';
part 'admin_add_draft_order_shipping_method.g.dart'; // AdminAddDraftOrderShippingMethod

@freezed
abstract class AdminAddDraftOrderShippingMethod
    with _$AdminAddDraftOrderShippingMethod {
  const AdminAddDraftOrderShippingMethod._();

  @jsonSerializable
  const factory AdminAddDraftOrderShippingMethod({
    /// shippingOptionId
    @JsonKey(name: AdminAddDraftOrderShippingMethod.shippingOptionIdKey)
    required String shippingOptionId,

    /// customAmount
    @JsonKey(name: AdminAddDraftOrderShippingMethod.customAmountKey)
    required double customAmount,

    /// description
    @JsonKey(name: AdminAddDraftOrderShippingMethod.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminAddDraftOrderShippingMethod.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminAddDraftOrderShippingMethod.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminAddDraftOrderShippingMethod;

  factory AdminAddDraftOrderShippingMethod.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminAddDraftOrderShippingMethodFromJson(json);

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String customAmountKey = r'custom_amount';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
