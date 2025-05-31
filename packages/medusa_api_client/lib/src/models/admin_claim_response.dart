/// AdminClaimResponse
/// {
///     "properties": {
///         "claim": {
///             "$ref": "#/components/schemas/AdminClaim"
///         }
///     },
///     "type": "object",
///     "required": [
///         "claim"
///     ],
///     "description": "The claim's details."
/// }
library admin_claim_response;

import 'exports.dart';
part 'admin_claim_response.freezed.dart';
part 'admin_claim_response.g.dart'; // AdminClaimResponse

@freezed
abstract class AdminClaimResponse with _$AdminClaimResponse {
  const AdminClaimResponse._();

  @jsonSerializable
  const factory AdminClaimResponse({
    /// claim
    @JsonKey(name: AdminClaimResponse.claimKey) required AdminClaim claim,
  }) = _AdminClaimResponse;

  factory AdminClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimResponseFromJson(json);

  static const String claimKey = r'claim';
}
