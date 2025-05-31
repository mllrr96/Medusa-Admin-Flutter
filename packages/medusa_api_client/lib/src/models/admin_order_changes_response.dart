/// AdminOrderChangesResponse
/// {
///     "properties": {
///         "order_changes": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminOrderChange"
///             },
///             "description": "An order's changes."
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_changes"
///     ],
///     "description": "The details of an order's changes."
/// }
library;

import 'exports.dart';
part 'admin_order_changes_response.freezed.dart';
part 'admin_order_changes_response.g.dart'; // AdminOrderChangesResponse

@freezed
abstract class AdminOrderChangesResponse with _$AdminOrderChangesResponse {
  const AdminOrderChangesResponse._();

  @jsonSerializable
  const factory AdminOrderChangesResponse({
    /// orderChanges
    @JsonKey(name: AdminOrderChangesResponse.orderChangesKey)
    required List<AdminOrderChange> orderChanges,
  }) = _AdminOrderChangesResponse;

  factory AdminOrderChangesResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderChangesResponseFromJson(json);

  static const String orderChangesKey = r'order_changes';
}
