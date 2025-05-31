/// AdminExchangeResponse
/// {
///     "properties": {
///         "exchange": {
///             "$ref": "#/components/schemas/AdminExchange"
///         }
///     },
///     "type": "object",
///     "required": [
///         "exchange"
///     ],
///     "description": "The exchange's details."
/// }
library admin_exchange_response;

import 'exports.dart';
part 'admin_exchange_response.freezed.dart';
part 'admin_exchange_response.g.dart'; // AdminExchangeResponse

@freezed
abstract class AdminExchangeResponse with _$AdminExchangeResponse {
  const AdminExchangeResponse._();

  @jsonSerializable
  const factory AdminExchangeResponse({
    /// exchange
    @JsonKey(name: AdminExchangeResponse.exchangeKey)
    required AdminExchange exchange,
  }) = _AdminExchangeResponse;

  factory AdminExchangeResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminExchangeResponseFromJson(json);

  static const String exchangeKey = r'exchange';
}
