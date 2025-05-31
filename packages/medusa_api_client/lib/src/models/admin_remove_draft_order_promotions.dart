/// AdminRemoveDraftOrderPromotions
/// {
///     "properties": {
///         "promo_codes": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A promotion code to remove from the draft order.",
///                 "title": "promo_codes"
///             },
///             "description": "The promotion codes to remove from the draft order."
///         }
///     },
///     "type": "object",
///     "required": [
///         "promo_codes"
///     ],
///     "description": "The promotion codes to remove from the draft order."
/// }
library;

import 'exports.dart';
part 'admin_remove_draft_order_promotions.freezed.dart';
part 'admin_remove_draft_order_promotions.g.dart'; // AdminRemoveDraftOrderPromotions

@freezed
abstract class AdminRemoveDraftOrderPromotions
    with _$AdminRemoveDraftOrderPromotions {
  const AdminRemoveDraftOrderPromotions._();

  @jsonSerializable
  const factory AdminRemoveDraftOrderPromotions({
    /// promoCodes
    @JsonKey(name: AdminRemoveDraftOrderPromotions.promoCodesKey)
    required List<String> promoCodes,
  }) = _AdminRemoveDraftOrderPromotions;

  factory AdminRemoveDraftOrderPromotions.fromJson(Map<String, dynamic> json) =>
      _$AdminRemoveDraftOrderPromotionsFromJson(json);

  static const String promoCodesKey = r'promo_codes';
}
