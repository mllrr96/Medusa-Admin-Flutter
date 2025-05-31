/// AdminOrderPreviewResponse
/// {
///     "properties": {
///         "order": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order"
///     ],
///     "description": "The preview of an order."
/// }
library;

import 'exports.dart';
part 'admin_order_preview_response.freezed.dart';
part 'admin_order_preview_response.g.dart'; // AdminOrderPreviewResponse

@freezed
abstract class AdminOrderPreviewResponse with _$AdminOrderPreviewResponse {
  const AdminOrderPreviewResponse._();

  @jsonSerializable
  const factory AdminOrderPreviewResponse({
    /// order
    @JsonKey(name: AdminOrderPreviewResponse.orderKey)
    required AdminOrderPreview order,
  }) = _AdminOrderPreviewResponse;

  factory AdminOrderPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderPreviewResponseFromJson(json);

  static const String orderKey = r'order';
}
