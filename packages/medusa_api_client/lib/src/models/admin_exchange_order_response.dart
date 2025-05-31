/// AdminExchangeOrderResponse
/// {
///     "properties": {
///         "order": {
///             "$ref": "#/components/schemas/Order"
///         },
///         "exchange": {
///             "$ref": "#/components/schemas/AdminExchange"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order",
///         "exchange"
///     ],
///     "description": "The exchange's details."
/// }
library;

import 'exports.dart';
part 'admin_exchange_order_response.freezed.dart';
part 'admin_exchange_order_response.g.dart'; // AdminExchangeOrderResponse

@freezed
abstract class AdminExchangeOrderResponse with _$AdminExchangeOrderResponse {
  const AdminExchangeOrderResponse._();

  @jsonSerializable
  const factory AdminExchangeOrderResponse({
    /// order
    @JsonKey(name: AdminExchangeOrderResponse.orderKey) required Order order,

    /// exchange
    @JsonKey(name: AdminExchangeOrderResponse.exchangeKey)
    required AdminExchange exchange,
  }) = _AdminExchangeOrderResponse;

  factory AdminExchangeOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminExchangeOrderResponseFromJson(json);

  static const String orderKey = r'order';

  static const String exchangeKey = r'exchange';
}
