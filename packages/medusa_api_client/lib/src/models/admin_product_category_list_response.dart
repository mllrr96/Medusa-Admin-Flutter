/// AdminProductCategoryListResponse
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
///                 "$ref": "#/components/schemas/AdminProductCategory"
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
part 'admin_product_category_list_response.freezed.dart';
part 'admin_product_category_list_response.g.dart'; // AdminProductCategoryListResponse

@freezed
abstract class AdminProductCategoryListResponse
    with _$AdminProductCategoryListResponse {
  const AdminProductCategoryListResponse._();

  @jsonSerializable
  const factory AdminProductCategoryListResponse({
    /// limit
    @JsonKey(name: AdminProductCategoryListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: AdminProductCategoryListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminProductCategoryListResponse.countKey)
    required int count,

    /// productCategories
    @JsonKey(name: AdminProductCategoryListResponse.productCategoriesKey)
    required List<AdminProductCategory> productCategories,

    /// estimateCount
    @JsonKey(name: AdminProductCategoryListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminProductCategoryListResponse;

  factory AdminProductCategoryListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductCategoryListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String productCategoriesKey = r'product_categories';

  static const String estimateCountKey = r'estimate_count';
}
