/// StoreCartRemovePromotion
/// {
///     "properties": {
///         "promo_codes": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A promotion code to remove from the cart.",
///                 "title": "promo_codes"
///             },
///             "description": "The promotion code to remove from the cart."
///         }
///     },
///     "type": "object",
///     "required": [
///         "promo_codes"
///     ],
///     "description": "The promotion code to remove from the cart."
/// }
library store_cart_remove_promotion;

import 'exports.dart';
part 'store_cart_remove_promotion.freezed.dart';
part 'store_cart_remove_promotion.g.dart'; // StoreCartRemovePromotion

@freezed
abstract class StoreCartRemovePromotion with _$StoreCartRemovePromotion {
  const StoreCartRemovePromotion._();

  @jsonSerializable
  const factory StoreCartRemovePromotion({
    /// promoCodes
    @JsonKey(name: StoreCartRemovePromotion.promoCodesKey)
    required List<String> promoCodes,
  }) = _StoreCartRemovePromotion;

  factory StoreCartRemovePromotion.fromJson(Map<String, dynamic> json) =>
      _$StoreCartRemovePromotionFromJson(json);

  static const String promoCodesKey = r'promo_codes';
}
