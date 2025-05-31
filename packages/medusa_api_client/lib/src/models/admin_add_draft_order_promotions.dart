/// AdminAddDraftOrderPromotions
/// {
///     "properties": {
///         "promo_codes": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A promotion's code.",
///                 "title": "promo_codes"
///             },
///             "description": "The list promotion codes to add to the draft order."
///         }
///     },
///     "type": "object",
///     "required": [
///         "promo_codes"
///     ],
///     "description": "The details of the promotions to add to a draft order."
/// }
library;

import 'exports.dart';
part 'admin_add_draft_order_promotions.freezed.dart';
part 'admin_add_draft_order_promotions.g.dart'; // AdminAddDraftOrderPromotions

@freezed
abstract class AdminAddDraftOrderPromotions
    with _$AdminAddDraftOrderPromotions {
  const AdminAddDraftOrderPromotions._();

  @jsonSerializable
  const factory AdminAddDraftOrderPromotions({
    /// promoCodes
    @JsonKey(name: AdminAddDraftOrderPromotions.promoCodesKey)
    required List<String> promoCodes,
  }) = _AdminAddDraftOrderPromotions;

  factory AdminAddDraftOrderPromotions.fromJson(Map<String, dynamic> json) =>
      _$AdminAddDraftOrderPromotionsFromJson(json);

  static const String promoCodesKey = r'promo_codes';
}
