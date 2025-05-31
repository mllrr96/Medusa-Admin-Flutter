/// StoreShippingOptionResponse
/// {
///     "properties": {
///         "shipping_option": {
///             "$ref": "#/components/schemas/StoreCartShippingOption"
///         }
///     },
///     "type": "object",
///     "required": [
///         "shipping_option"
///     ],
///     "description": "The shipping option's details."
/// }
library;

import 'exports.dart';
part 'store_shipping_option_response.freezed.dart';
part 'store_shipping_option_response.g.dart'; // StoreShippingOptionResponse

@freezed
abstract class StoreShippingOptionResponse with _$StoreShippingOptionResponse {
  const StoreShippingOptionResponse._();

  @jsonSerializable
  const factory StoreShippingOptionResponse({
    /// shippingOption
    @JsonKey(name: StoreShippingOptionResponse.shippingOptionKey)
    required StoreCartShippingOption shippingOption,
  }) = _StoreShippingOptionResponse;

  factory StoreShippingOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreShippingOptionResponseFromJson(json);

  static const String shippingOptionKey = r'shipping_option';
}
