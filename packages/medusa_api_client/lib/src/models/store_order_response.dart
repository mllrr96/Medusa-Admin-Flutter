/// StoreOrderResponse
/// {
///     "properties": {
///         "order": {
///             "$ref": "#/components/schemas/StoreOrder"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order"
///     ],
///     "description": "The order's details."
/// }
library;

import 'exports.dart';
part 'store_order_response.freezed.dart';
part 'store_order_response.g.dart'; // StoreOrderResponse

@freezed
abstract class StoreOrderResponse with _$StoreOrderResponse {
  const StoreOrderResponse._();

  @jsonSerializable
  const factory StoreOrderResponse({
    /// order
    @JsonKey(name: StoreOrderResponse.orderKey) required StoreOrder order,
  }) = _StoreOrderResponse;

  factory StoreOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreOrderResponseFromJson(json);

  static const String orderKey = r'order';
}
