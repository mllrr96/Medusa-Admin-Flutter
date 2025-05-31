/// AdminPricePreferenceResponse
/// {
///     "properties": {
///         "price_preference": {
///             "$ref": "#/components/schemas/AdminPricePreference"
///         }
///     },
///     "type": "object",
///     "required": [
///         "price_preference"
///     ],
///     "description": "The price preference's details."
/// }
library;

import 'exports.dart';
part 'admin_price_preference_response.freezed.dart';
part 'admin_price_preference_response.g.dart'; // AdminPricePreferenceResponse

@freezed
abstract class AdminPricePreferenceResponse
    with _$AdminPricePreferenceResponse {
  const AdminPricePreferenceResponse._();

  @jsonSerializable
  const factory AdminPricePreferenceResponse({
    /// pricePreference
    @JsonKey(name: AdminPricePreferenceResponse.pricePreferenceKey)
    required AdminPricePreference pricePreference,
  }) = _AdminPricePreferenceResponse;

  factory AdminPricePreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPricePreferenceResponseFromJson(json);

  static const String pricePreferenceKey = r'price_preference';
}
