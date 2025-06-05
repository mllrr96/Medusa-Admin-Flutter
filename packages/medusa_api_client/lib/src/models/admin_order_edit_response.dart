/// AdminOrderEditResponse
/// {
///     "properties": {
///         "order_change": {
///             "$ref": "#/components/schemas/AdminOrderChange"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_change"
///     ],
///     "description": "An order edit's details."
/// }
library;

import 'exports.dart';
part 'admin_order_edit_response.freezed.dart';
part 'admin_order_edit_response.g.dart'; // AdminOrderEditResponse

@freezed
abstract class AdminOrderEditResponse with _$AdminOrderEditResponse {
  const AdminOrderEditResponse._();

  @jsonSerializable
  const factory AdminOrderEditResponse({
    /// orderChange
    @JsonKey(name: AdminOrderEditResponse.orderChangeKey)
    required AdminOrderChange orderChange,
  }) = _AdminOrderEditResponse;

  factory AdminOrderEditResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderEditResponseFromJson(json);

  static const String orderChangeKey = r'order_change';
}
