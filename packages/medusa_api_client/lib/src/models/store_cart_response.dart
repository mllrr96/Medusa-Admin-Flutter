/// StoreCartResponse
/// {
///     "properties": {
///         "cart": {
///             "$ref": "#/components/schemas/StoreCart"
///         }
///     },
///     "type": "object",
///     "required": [
///         "cart"
///     ],
///     "description": "The cart's details."
/// }
library;

import 'exports.dart';
part 'store_cart_response.freezed.dart';
part 'store_cart_response.g.dart'; // StoreCartResponse

@freezed
abstract class StoreCartResponse with _$StoreCartResponse {
  const StoreCartResponse._();

  @jsonSerializable
  const factory StoreCartResponse({
    /// cart
    @JsonKey(name: StoreCartResponse.cartKey) required StoreCart cart,
  }) = _StoreCartResponse;

  factory StoreCartResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreCartResponseFromJson(json);

  static const String cartKey = r'cart';
}
