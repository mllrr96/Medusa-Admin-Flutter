/// StoreProductTagListResponse
/// {
///     "properties": {
///         "limit": {
///             "type": "number",
///             "description": "The maximum number of items returned.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip before retrieving the returned items.",
///             "title": "offset"
///         },
///         "count": {
///             "type": "number",
///             "description": "The total number of items available.",
///             "title": "count"
///         },
///         "product_tags": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductTag"
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
part 'store_product_tag_list_response.freezed.dart';
part 'store_product_tag_list_response.g.dart'; // StoreProductTagListResponse

@freezed
abstract class StoreProductTagListResponse with _$StoreProductTagListResponse {
  const StoreProductTagListResponse._();

  @jsonSerializable
  const factory StoreProductTagListResponse({
    /// limit
    @JsonKey(name: StoreProductTagListResponse.limitKey) required double limit,

    /// offset
    @JsonKey(name: StoreProductTagListResponse.offsetKey)
    required double offset,

    /// count
    @JsonKey(name: StoreProductTagListResponse.countKey) required double count,

    /// productTags
    @JsonKey(name: StoreProductTagListResponse.productTagsKey)
    required List<StoreProductTag> productTags,

    /// estimateCount
    @JsonKey(name: StoreProductTagListResponse.estimateCountKey)
    required double estimateCount,
  }) = _StoreProductTagListResponse;

  factory StoreProductTagListResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreProductTagListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String productTagsKey = r'product_tags';

  static const String estimateCountKey = r'estimate_count';
}
