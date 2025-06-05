/// AdminStoreListResponse
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
///         "stores": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminStore"
///             },
///             "description": "The list of stores."
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
///         "stores"
///     ],
///     "description": "The paginated list of stores."
/// }
library;

import 'exports.dart';
part 'admin_store_list_response.freezed.dart';
part 'admin_store_list_response.g.dart'; // AdminStoreListResponse

@freezed
abstract class AdminStoreListResponse with _$AdminStoreListResponse {
  const AdminStoreListResponse._();

  @jsonSerializable
  const factory AdminStoreListResponse({
    /// limit
    @JsonKey(name: AdminStoreListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: AdminStoreListResponse.offsetKey) required int offset,

    /// count
    @JsonKey(name: AdminStoreListResponse.countKey) required int count,

    /// stores
    @JsonKey(name: AdminStoreListResponse.storesKey)
    required List<AdminStore> stores,

    /// estimateCount
    @JsonKey(name: AdminStoreListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminStoreListResponse;

  factory AdminStoreListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminStoreListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String storesKey = r'stores';

  static const String estimateCountKey = r'estimate_count';
}
