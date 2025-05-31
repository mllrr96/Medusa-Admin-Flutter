/// AdminUpdateDraftOrderActionShippingMethod
/// {
///     "properties": {
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the associated shipping option.",
///             "title": "shipping_option_id"
///         },
///         "custom_amount": {
///             "type": "number",
///             "description": "The custom amount of the shipping method. If not provided, the shipping option's amount will be used.",
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
///     "description": "The updates to make on a changed shipping method."
/// }
library;

import 'exports.dart';
part 'admin_update_draft_order_action_shipping_method.freezed.dart';
part 'admin_update_draft_order_action_shipping_method.g.dart'; // AdminUpdateDraftOrderActionShippingMethod

@freezed
abstract class AdminUpdateDraftOrderActionShippingMethod
    with _$AdminUpdateDraftOrderActionShippingMethod {
  const AdminUpdateDraftOrderActionShippingMethod._();

  @jsonSerializable
  const factory AdminUpdateDraftOrderActionShippingMethod({
    /// shippingOptionId
    @JsonKey(
      name: AdminUpdateDraftOrderActionShippingMethod.shippingOptionIdKey,
    )
    required String shippingOptionId,

    /// customAmount
    @JsonKey(name: AdminUpdateDraftOrderActionShippingMethod.customAmountKey)
    required double customAmount,

    /// description
    @JsonKey(name: AdminUpdateDraftOrderActionShippingMethod.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminUpdateDraftOrderActionShippingMethod.internalNoteKey)
    required String internalNote,

    /// metadata
    @JsonKey(name: AdminUpdateDraftOrderActionShippingMethod.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateDraftOrderActionShippingMethod;

  factory AdminUpdateDraftOrderActionShippingMethod.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminUpdateDraftOrderActionShippingMethodFromJson(json);

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String customAmountKey = r'custom_amount';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';

  static const String metadataKey = r'metadata';
}
