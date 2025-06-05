/// AdminCollectionListResponse
/// {
///     "properties": {
///         "limit": {
///             "type": "number",
///             "description": "The maximum number of items returned.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items skipped before retrieving the returned results.",
///             "title": "offset"
///         },
///         "count": {
///             "type": "number",
///             "description": "The total number of items.",
///             "title": "count"
///         },
///         "collections": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCollection"
///             },
///             "description": "The list of product collections."
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
///         "collections"
///     ],
///     "description": "The paginated list of product collections."
/// }
library;

import 'exports.dart';
part 'admin_collection_list_response.freezed.dart';
part 'admin_collection_list_response.g.dart'; // AdminCollectionListResponse

@freezed
abstract class AdminCollectionListResponse with _$AdminCollectionListResponse {
  const AdminCollectionListResponse._();

  @jsonSerializable
  const factory AdminCollectionListResponse({
    /// limit
    @JsonKey(name: AdminCollectionListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: AdminCollectionListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminCollectionListResponse.countKey) required int count,

    /// collections
    @JsonKey(name: AdminCollectionListResponse.collectionsKey)
    required List<AdminCollection> collections,

    /// estimateCount
    @JsonKey(name: AdminCollectionListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminCollectionListResponse;

  factory AdminCollectionListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCollectionListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String collectionsKey = r'collections';

  static const String estimateCountKey = r'estimate_count';
}
