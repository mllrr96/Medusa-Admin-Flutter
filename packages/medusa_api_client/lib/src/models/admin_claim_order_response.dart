/// AdminClaimOrderResponse
/// {
///     "properties": {
///         "order": {
///             "$ref": "#/components/schemas/Order"
///         },
///         "claim": {
///             "$ref": "#/components/schemas/AdminClaim"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order",
///         "claim"
///     ],
///     "description": "The created claim's details."
/// }
library;

import 'exports.dart';
part 'admin_claim_order_response.freezed.dart';
part 'admin_claim_order_response.g.dart'; // AdminClaimOrderResponse

@freezed
abstract class AdminClaimOrderResponse with _$AdminClaimOrderResponse {
  const AdminClaimOrderResponse._();

  @jsonSerializable
  const factory AdminClaimOrderResponse({
    /// order
    @JsonKey(name: AdminClaimOrderResponse.orderKey) required Order order,

    /// claim
    @JsonKey(name: AdminClaimOrderResponse.claimKey) required AdminClaim claim,
  }) = _AdminClaimOrderResponse;

  factory AdminClaimOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimOrderResponseFromJson(json);

  static const String orderKey = r'order';

  static const String claimKey = r'claim';
}
