/// AdminOrderReturnResponse
/// {
///     "properties": {
///         "order": {
///             "$ref": "#/components/schemas/Order"
///         },
///         "return": {
///             "$ref": "#/components/schemas/AdminReturn"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order",
///         "return"
///     ],
///     "description": "The order return details."
/// }
library admin_order_return_response;

import 'exports.dart';
part 'admin_order_return_response.freezed.dart';
part 'admin_order_return_response.g.dart'; // AdminOrderReturnResponse

@freezed
abstract class AdminOrderReturnResponse with _$AdminOrderReturnResponse {
  const AdminOrderReturnResponse._();

  @jsonSerializable
  const factory AdminOrderReturnResponse({
    /// order
    @JsonKey(name: AdminOrderReturnResponse.orderKey) required Order order,

    /// returnAA
    @JsonKey(name: AdminOrderReturnResponse.returnAAKey)
    required AdminReturn returnAA,
  }) = _AdminOrderReturnResponse;

  factory AdminOrderReturnResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderReturnResponseFromJson(json);

  static const String orderKey = r'order';

  static const String returnAAKey = r'return';
}
