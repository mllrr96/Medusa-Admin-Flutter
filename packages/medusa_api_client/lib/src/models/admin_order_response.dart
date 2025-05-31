/// AdminOrderResponse
/// {
///     "properties": {
///         "order": {
///             "$ref": "#/components/schemas/AdminOrder"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order"
///     ],
///     "description": "An order's details."
/// }
library admin_order_response;

import 'exports.dart';
part 'admin_order_response.freezed.dart';
part 'admin_order_response.g.dart'; // AdminOrderResponse

@freezed
abstract class AdminOrderResponse with _$AdminOrderResponse {
  const AdminOrderResponse._();

  @jsonSerializable
  const factory AdminOrderResponse({
    /// order
    @JsonKey(name: AdminOrderResponse.orderKey) required AdminOrder order,
  }) = _AdminOrderResponse;

  factory AdminOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderResponseFromJson(json);

  static const String orderKey = r'order';
}
