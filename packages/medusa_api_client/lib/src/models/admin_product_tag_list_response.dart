/// AdminProductTagListResponse
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
///         "product_tags": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductTag"
///             },
///             "description": "The list of product tags."
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
///         "product_tags"
///     ],
///     "description": "The paginated list of product tags."
/// }
library;

import 'exports.dart';
part 'admin_product_tag_list_response.freezed.dart';
part 'admin_product_tag_list_response.g.dart'; // AdminProductTagListResponse

@freezed
abstract class AdminProductTagListResponse with _$AdminProductTagListResponse {
  const AdminProductTagListResponse._();

  @jsonSerializable
  const factory AdminProductTagListResponse({
    /// limit
    @JsonKey(name: AdminProductTagListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: AdminProductTagListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminProductTagListResponse.countKey) required int count,

    /// productTags
    @JsonKey(name: AdminProductTagListResponse.productTagsKey)
    required List<AdminProductTag> productTags,

    /// estimateCount
    @JsonKey(name: AdminProductTagListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminProductTagListResponse;

  factory AdminProductTagListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTagListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String productTagsKey = r'product_tags';

  static const String estimateCountKey = r'estimate_count';
}
