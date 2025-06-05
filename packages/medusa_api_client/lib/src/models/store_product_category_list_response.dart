/// StoreProductCategoryListResponse
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
///         "product_categories": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductCategory"
///             },
///             "description": "The list of product categories."
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
///         "product_categories"
///     ],
///     "description": "The paginated list of product categories."
/// }
library;

import 'exports.dart';
part 'store_product_category_list_response.freezed.dart';
part 'store_product_category_list_response.g.dart'; // StoreProductCategoryListResponse

@freezed
abstract class StoreProductCategoryListResponse
    with _$StoreProductCategoryListResponse {
  const StoreProductCategoryListResponse._();

  @jsonSerializable
  const factory StoreProductCategoryListResponse({
    /// limit
    @JsonKey(name: StoreProductCategoryListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: StoreProductCategoryListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: StoreProductCategoryListResponse.countKey)
    required int count,

    /// productCategories
    @JsonKey(name: StoreProductCategoryListResponse.productCategoriesKey)
    required List<StoreProductCategory> productCategories,

    /// estimateCount
    @JsonKey(name: StoreProductCategoryListResponse.estimateCountKey)
    required double estimateCount,
  }) = _StoreProductCategoryListResponse;

  factory StoreProductCategoryListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$StoreProductCategoryListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String productCategoriesKey = r'product_categories';

  static const String estimateCountKey = r'estimate_count';
}
