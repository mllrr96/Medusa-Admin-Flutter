/// AdminReturnReasonListResponse
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
///         "return_reasons": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminReturnReason"
///             },
///             "description": "The list of return reasons."
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
///         "return_reasons"
///     ],
///     "description": "The paginated list of return reasons."
/// }
library;

import 'exports.dart';
part 'admin_return_reason_list_response.freezed.dart';
part 'admin_return_reason_list_response.g.dart'; // AdminReturnReasonListResponse

@freezed
abstract class AdminReturnReasonListResponse
    with _$AdminReturnReasonListResponse {
  const AdminReturnReasonListResponse._();

  @jsonSerializable
  const factory AdminReturnReasonListResponse({
    /// limit
    @JsonKey(name: AdminReturnReasonListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: AdminReturnReasonListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminReturnReasonListResponse.countKey)
    required int count,

    /// returnReasons
    @JsonKey(name: AdminReturnReasonListResponse.returnReasonsKey)
    required List<AdminReturnReason> returnReasons,

    /// estimateCount
    @JsonKey(name: AdminReturnReasonListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminReturnReasonListResponse;

  factory AdminReturnReasonListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnReasonListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String returnReasonsKey = r'return_reasons';

  static const String estimateCountKey = r'estimate_count';
}
