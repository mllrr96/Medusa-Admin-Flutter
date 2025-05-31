/// AdminClaimRequestResponse
/// {
///     "properties": {
///         "return": {
///             "$ref": "#/components/schemas/AdminReturn"
///         },
///         "order_preview": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         },
///         "claim": {
///             "$ref": "#/components/schemas/AdminClaim"
///         }
///     },
///     "type": "object",
///     "required": [
///         "return",
///         "order_preview",
///         "claim"
///     ],
///     "description": "The details of the claim, its return, and a preview of the order when the claim is applied."
/// }
library;

import 'exports.dart';
part 'admin_claim_request_response.freezed.dart';
part 'admin_claim_request_response.g.dart'; // AdminClaimRequestResponse

@freezed
abstract class AdminClaimRequestResponse with _$AdminClaimRequestResponse {
  const AdminClaimRequestResponse._();

  @jsonSerializable
  const factory AdminClaimRequestResponse({
    /// returnAA
    @JsonKey(name: AdminClaimRequestResponse.returnAAKey)
    required AdminReturn returnAA,

    /// orderPreview
    @JsonKey(name: AdminClaimRequestResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,

    /// claim
    @JsonKey(name: AdminClaimRequestResponse.claimKey)
    required AdminClaim claim,
  }) = _AdminClaimRequestResponse;

  factory AdminClaimRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimRequestResponseFromJson(json);

  static const String returnAAKey = r'return';

  static const String orderPreviewKey = r'order_preview';

  static const String claimKey = r'claim';
}
