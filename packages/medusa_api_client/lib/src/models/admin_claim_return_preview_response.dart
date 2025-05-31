/// AdminClaimReturnPreviewResponse
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
///     "description": "The details of the claim's return, with a preview of the order when the claim's return is applied."
/// }
library;

import 'exports.dart';
part 'admin_claim_return_preview_response.freezed.dart';
part 'admin_claim_return_preview_response.g.dart'; // AdminClaimReturnPreviewResponse

@freezed
abstract class AdminClaimReturnPreviewResponse
    with _$AdminClaimReturnPreviewResponse {
  const AdminClaimReturnPreviewResponse._();

  @jsonSerializable
  const factory AdminClaimReturnPreviewResponse({
    /// orderPreview
    @JsonKey(name: AdminClaimReturnPreviewResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,

    /// returnAA
    @JsonKey(name: AdminClaimReturnPreviewResponse.returnAAKey)
    required AdminReturn returnAA,
  }) = _AdminClaimReturnPreviewResponse;

  factory AdminClaimReturnPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimReturnPreviewResponseFromJson(json);

  static const String orderPreviewKey = r'order_preview';

  static const String returnAAKey = r'return';
}
