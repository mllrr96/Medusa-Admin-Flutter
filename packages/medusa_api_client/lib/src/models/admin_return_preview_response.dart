/// AdminReturnPreviewResponse
/// {
///     "properties": {
///         "order_preview": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         },
///         "return": {
///             "$ref": "#/components/schemas/AdminReturn"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_preview",
///         "return"
///     ],
///     "description": "The details of a return and a preview of the order once the return is applied."
/// }
library;

import 'exports.dart';
part 'admin_return_preview_response.freezed.dart';
part 'admin_return_preview_response.g.dart'; // AdminReturnPreviewResponse

@freezed
abstract class AdminReturnPreviewResponse with _$AdminReturnPreviewResponse {
  const AdminReturnPreviewResponse._();

  @jsonSerializable
  const factory AdminReturnPreviewResponse({
    /// orderPreview
    @JsonKey(name: AdminReturnPreviewResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,

    /// returnAA
    @JsonKey(name: AdminReturnPreviewResponse.returnAAKey)
    required AdminReturn returnAA,
  }) = _AdminReturnPreviewResponse;

  factory AdminReturnPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnPreviewResponseFromJson(json);

  static const String orderPreviewKey = r'order_preview';

  static const String returnAAKey = r'return';
}
