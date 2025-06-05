/// StoreCartAddPromotion
/// {
///     "properties": {
///         "promo_codes": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A promotion code.",
///                 "title": "promo_codes"
///             },
///             "description": "Promotion codes to add to the cart."
///         }
///     },
///     "type": "object",
///     "required": [
///         "promo_codes"
///     ],
///     "description": "The promotion's details."
/// }
library;

import 'exports.dart';
part 'store_cart_add_promotion.freezed.dart';
part 'store_cart_add_promotion.g.dart'; // StoreCartAddPromotion

@freezed
abstract class StoreCartAddPromotion with _$StoreCartAddPromotion {
  const StoreCartAddPromotion._();

  @jsonSerializable
  const factory StoreCartAddPromotion({
    /// promoCodes
    @JsonKey(name: StoreCartAddPromotion.promoCodesKey)
    required List<String> promoCodes,
  }) = _StoreCartAddPromotion;

  factory StoreCartAddPromotion.fromJson(Map<String, dynamic> json) =>
      _$StoreCartAddPromotionFromJson(json);

  static const String promoCodesKey = r'promo_codes';
}
