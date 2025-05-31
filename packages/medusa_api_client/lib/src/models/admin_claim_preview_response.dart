/// AdminClaimPreviewResponse
/// {
///     "properties": {
///         "order_preview": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         },
///         "claim": {
///             "$ref": "#/components/schemas/AdminClaim"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_preview",
///         "claim"
///     ],
///     "description": "The details of the claim, as well as a preview of the order when the claim is applied."
/// }
library admin_claim_preview_response;

import 'exports.dart';
part 'admin_claim_preview_response.freezed.dart';
part 'admin_claim_preview_response.g.dart'; // AdminClaimPreviewResponse

@freezed
abstract class AdminClaimPreviewResponse with _$AdminClaimPreviewResponse {
  const AdminClaimPreviewResponse._();

  @jsonSerializable
  const factory AdminClaimPreviewResponse({
    /// orderPreview
    @JsonKey(name: AdminClaimPreviewResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,

    /// claim
    @JsonKey(name: AdminClaimPreviewResponse.claimKey)
    required AdminClaim claim,
  }) = _AdminClaimPreviewResponse;

  factory AdminClaimPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimPreviewResponseFromJson(json);

  static const String orderPreviewKey = r'order_preview';

  static const String claimKey = r'claim';
}
