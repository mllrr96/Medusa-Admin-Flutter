/// AdminCurrencyResponse
/// {
///     "properties": {
///         "currency": {
///             "$ref": "#/components/schemas/AdminCurrency"
///         }
///     },
///     "type": "object",
///     "required": [
///         "currency"
///     ],
///     "description": "The currency's details."
/// }
library admin_currency_response;

import 'exports.dart';
part 'admin_currency_response.freezed.dart';
part 'admin_currency_response.g.dart'; // AdminCurrencyResponse

@freezed
abstract class AdminCurrencyResponse with _$AdminCurrencyResponse {
  const AdminCurrencyResponse._();

  @jsonSerializable
  const factory AdminCurrencyResponse({
    /// currency
    @JsonKey(name: AdminCurrencyResponse.currencyKey)
    required AdminCurrency currency,
  }) = _AdminCurrencyResponse;

  factory AdminCurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCurrencyResponseFromJson(json);

  static const String currencyKey = r'currency';
}
