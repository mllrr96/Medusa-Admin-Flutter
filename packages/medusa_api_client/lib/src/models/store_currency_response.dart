/// StoreCurrencyResponse
/// {
///     "properties": {
///         "currency": {
///             "$ref": "#/components/schemas/StoreCurrency"
///         }
///     },
///     "type": "object",
///     "required": [
///         "currency"
///     ],
///     "description": "The currency's details."
/// }
library store_currency_response;

import 'exports.dart';
part 'store_currency_response.freezed.dart';
part 'store_currency_response.g.dart'; // StoreCurrencyResponse

@freezed
abstract class StoreCurrencyResponse with _$StoreCurrencyResponse {
  const StoreCurrencyResponse._();

  @jsonSerializable
  const factory StoreCurrencyResponse({
    /// currency
    @JsonKey(name: StoreCurrencyResponse.currencyKey)
    required StoreCurrency currency,
  }) = _StoreCurrencyResponse;

  factory StoreCurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreCurrencyResponseFromJson(json);

  static const String currencyKey = r'currency';
}
