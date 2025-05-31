/// StoreShippingOptionListResponse
/// {
///     "properties": {
///         "shipping_options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCartShippingOption"
///             },
///             "description": "The shipping option's shipping options."
///         }
///     },
///     "type": "object",
///     "required": [
///         "shipping_options"
///     ],
///     "description": "The shipping option's details."
/// }
library;

import 'exports.dart';
part 'store_shipping_option_list_response.freezed.dart';
part 'store_shipping_option_list_response.g.dart'; // StoreShippingOptionListResponse

@freezed
abstract class StoreShippingOptionListResponse
    with _$StoreShippingOptionListResponse {
  const StoreShippingOptionListResponse._();

  @jsonSerializable
  const factory StoreShippingOptionListResponse({
    /// shippingOptions
    @JsonKey(name: StoreShippingOptionListResponse.shippingOptionsKey)
    required List<StoreCartShippingOption> shippingOptions,
  }) = _StoreShippingOptionListResponse;

  factory StoreShippingOptionListResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreShippingOptionListResponseFromJson(json);

  static const String shippingOptionsKey = r'shipping_options';
}
