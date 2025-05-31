/// AdminOrderEditPreviewResponse
/// {
///     "properties": {
///         "order_preview": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_preview"
///     ],
///     "description": "The preview of an order edit."
/// }
library;

import 'exports.dart';
part 'admin_order_edit_preview_response.freezed.dart';
part 'admin_order_edit_preview_response.g.dart'; // AdminOrderEditPreviewResponse

@freezed
abstract class AdminOrderEditPreviewResponse
    with _$AdminOrderEditPreviewResponse {
  const AdminOrderEditPreviewResponse._();

  @jsonSerializable
  const factory AdminOrderEditPreviewResponse({
    /// orderPreview
    @JsonKey(name: AdminOrderEditPreviewResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,
  }) = _AdminOrderEditPreviewResponse;

  factory AdminOrderEditPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderEditPreviewResponseFromJson(json);

  static const String orderPreviewKey = r'order_preview';
}
