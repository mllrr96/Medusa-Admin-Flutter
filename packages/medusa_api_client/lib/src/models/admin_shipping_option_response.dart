/// AdminShippingOptionResponse
/// {
///     "properties": {
///         "shipping_option": {
///             "$ref": "#/components/schemas/AdminShippingOption"
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
part 'admin_shipping_option_response.freezed.dart';
part 'admin_shipping_option_response.g.dart'; // AdminShippingOptionResponse

@freezed
abstract class AdminShippingOptionResponse with _$AdminShippingOptionResponse {
  const AdminShippingOptionResponse._();

  @jsonSerializable
  const factory AdminShippingOptionResponse({
    /// shippingOption
    @JsonKey(name: AdminShippingOptionResponse.shippingOptionKey)
    required AdminShippingOption shippingOption,
  }) = _AdminShippingOptionResponse;

  factory AdminShippingOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingOptionResponseFromJson(json);

  static const String shippingOptionKey = r'shipping_option';
}
