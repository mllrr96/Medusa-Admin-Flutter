/// AdminUpdateDraftOrderShippingMethod
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
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users about the shipping method.",
///             "title": "internal_note"
///         }
///     },
///     "type": "object",
///     "description": "The updates to make on a draft order's shipping method."
/// }
library;

import 'exports.dart';
part 'admin_update_draft_order_shipping_method.freezed.dart';
part 'admin_update_draft_order_shipping_method.g.dart'; // AdminUpdateDraftOrderShippingMethod

@freezed
abstract class AdminUpdateDraftOrderShippingMethod
    with _$AdminUpdateDraftOrderShippingMethod {
  const AdminUpdateDraftOrderShippingMethod._();

  @jsonSerializable
  const factory AdminUpdateDraftOrderShippingMethod({
    /// shippingOptionId
    @JsonKey(name: AdminUpdateDraftOrderShippingMethod.shippingOptionIdKey)
    required String shippingOptionId,

    /// customAmount
    @JsonKey(name: AdminUpdateDraftOrderShippingMethod.customAmountKey)
    required double customAmount,

    /// internalNote
    @JsonKey(name: AdminUpdateDraftOrderShippingMethod.internalNoteKey)
    required String internalNote,
  }) = _AdminUpdateDraftOrderShippingMethod;

  factory AdminUpdateDraftOrderShippingMethod.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminUpdateDraftOrderShippingMethodFromJson(json);

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String customAmountKey = r'custom_amount';

  static const String internalNoteKey = r'internal_note';
}
