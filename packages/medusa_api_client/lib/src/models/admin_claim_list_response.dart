/// AdminClaimListResponse
/// {
///     "properties": {
///         "limit": {
///             "type": "number",
///             "description": "The maximum number of items returned.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items skipped before retrieving the returned items.",
///             "title": "offset"
///         },
///         "count": {
///             "type": "number",
///             "description": "The total number of items.",
///             "title": "count"
///         },
///         "claims": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminClaim"
///             },
///             "description": "The list of claims."
///         },
///         "estimate_count": {
///             "type": "number",
///             "description": "The estimated count retrieved from the PostgreSQL query planner, which may be inaccurate.",
///             "title": "estimate_count"
///         }
///     },
///     "type": "object",
///     "required": [
///         "limit",
///         "offset",
///         "count",
///         "claims"
///     ],
///     "description": "The paginated list of claims."
/// }
library;

import 'exports.dart';
part 'admin_claim_list_response.freezed.dart';
part 'admin_claim_list_response.g.dart'; // AdminClaimListResponse

@freezed
abstract class AdminClaimListResponse with _$AdminClaimListResponse {
  const AdminClaimListResponse._();

  @jsonSerializable
  const factory AdminClaimListResponse({
    /// limit
    @JsonKey(name: AdminClaimListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: AdminClaimListResponse.offsetKey) required int offset,

    /// count
    @JsonKey(name: AdminClaimListResponse.countKey) required int count,

    /// claims
    @JsonKey(name: AdminClaimListResponse.claimsKey)
    required List<AdminClaim> claims,

    /// estimateCount
    @JsonKey(name: AdminClaimListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminClaimListResponse;

  factory AdminClaimListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String claimsKey = r'claims';

  static const String estimateCountKey = r'estimate_count';
}
