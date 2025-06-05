/// StoreCartPromotion
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The promotion's ID.",
///             "title": "id"
///         },
///         "code": {
///             "type": "string",
///             "description": "The promotion's code.",
///             "title": "code"
///         },
///         "is_automatic": {
///             "type": "boolean",
///             "description": "The promotion's is automatic.",
///             "title": "is_automatic"
///         },
///         "application_method": {
///             "type": "object",
///             "description": "The promotion's application method."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id"
///     ],
///     "description": "The promotion's promotions."
/// }
library;

import 'exports.dart';
part 'store_cart_promotion.freezed.dart';
part 'store_cart_promotion.g.dart'; // StoreCartPromotion

@freezed
abstract class StoreCartPromotion with _$StoreCartPromotion {
  const StoreCartPromotion._();

  @jsonSerializable
  const factory StoreCartPromotion({
    /// id
    @JsonKey(name: StoreCartPromotion.idKey) required String id,

    /// code
    @JsonKey(name: StoreCartPromotion.codeKey) required String code,

    /// isAutomatic
    @JsonKey(name: StoreCartPromotion.isAutomaticKey) required bool isAutomatic,

    /// applicationMethod
    @JsonKey(name: StoreCartPromotion.applicationMethodKey)
    required Map<String, dynamic> applicationMethod,
  }) = _StoreCartPromotion;

  factory StoreCartPromotion.fromJson(Map<String, dynamic> json) =>
      _$StoreCartPromotionFromJson(json);

  static const String idKey = r'id';

  static const String codeKey = r'code';

  static const String isAutomaticKey = r'is_automatic';

  static const String applicationMethodKey = r'application_method';
}
