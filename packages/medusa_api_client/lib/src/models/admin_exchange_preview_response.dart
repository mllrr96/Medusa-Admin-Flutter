/// AdminExchangePreviewResponse
/// {
///     "properties": {
///         "order_preview": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         },
///         "exchange": {
///             "$ref": "#/components/schemas/AdminExchange"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_preview",
///         "exchange"
///     ],
///     "description": "A preview of the order once the exchange is applied."
/// }
library;

import 'exports.dart';
part 'admin_exchange_preview_response.freezed.dart';
part 'admin_exchange_preview_response.g.dart'; // AdminExchangePreviewResponse

@freezed
abstract class AdminExchangePreviewResponse
    with _$AdminExchangePreviewResponse {
  const AdminExchangePreviewResponse._();

  @jsonSerializable
  const factory AdminExchangePreviewResponse({
    /// orderPreview
    @JsonKey(name: AdminExchangePreviewResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,

    /// exchange
    @JsonKey(name: AdminExchangePreviewResponse.exchangeKey)
    required AdminExchange exchange,
  }) = _AdminExchangePreviewResponse;

  factory AdminExchangePreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminExchangePreviewResponseFromJson(json);

  static const String orderPreviewKey = r'order_preview';

  static const String exchangeKey = r'exchange';
}
