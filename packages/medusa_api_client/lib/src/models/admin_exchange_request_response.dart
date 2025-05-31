/// AdminExchangeRequestResponse
/// {
///     "properties": {
///         "return": {
///             "$ref": "#/components/schemas/AdminReturn"
///         },
///         "order_preview": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         },
///         "exchange": {
///             "$ref": "#/components/schemas/AdminExchange"
///         }
///     },
///     "type": "object",
///     "required": [
///         "return",
///         "order_preview",
///         "exchange"
///     ],
///     "description": "The details of a requested exchange."
/// }
library;

import 'exports.dart';
part 'admin_exchange_request_response.freezed.dart';
part 'admin_exchange_request_response.g.dart'; // AdminExchangeRequestResponse

@freezed
abstract class AdminExchangeRequestResponse
    with _$AdminExchangeRequestResponse {
  const AdminExchangeRequestResponse._();

  @jsonSerializable
  const factory AdminExchangeRequestResponse({
    /// returnAA
    @JsonKey(name: AdminExchangeRequestResponse.returnAAKey)
    required AdminReturn returnAA,

    /// orderPreview
    @JsonKey(name: AdminExchangeRequestResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,

    /// exchange
    @JsonKey(name: AdminExchangeRequestResponse.exchangeKey)
    required AdminExchange exchange,
  }) = _AdminExchangeRequestResponse;

  factory AdminExchangeRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminExchangeRequestResponseFromJson(json);

  static const String returnAAKey = r'return';

  static const String orderPreviewKey = r'order_preview';

  static const String exchangeKey = r'exchange';
}
