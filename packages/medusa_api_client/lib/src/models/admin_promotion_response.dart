/// AdminPromotionResponse
/// {
///     "properties": {
///         "promotion": {
///             "$ref": "#/components/schemas/AdminPromotion"
///         }
///     },
///     "type": "object",
///     "required": [
///         "promotion"
///     ],
///     "description": "The promotion's details."
/// }
library;

import 'exports.dart';
part 'admin_promotion_response.freezed.dart';
part 'admin_promotion_response.g.dart'; // AdminPromotionResponse

@freezed
abstract class AdminPromotionResponse with _$AdminPromotionResponse {
  const AdminPromotionResponse._();

  @jsonSerializable
  const factory AdminPromotionResponse({
    /// promotion
    @JsonKey(name: AdminPromotionResponse.promotionKey)
    required AdminPromotion promotion,
  }) = _AdminPromotionResponse;

  factory AdminPromotionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPromotionResponseFromJson(json);

  static const String promotionKey = r'promotion';
}
