/// StoreProductTypeListResponse
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
///         "product_types": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductType"
///             },
///             "description": "The list of product types."
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
///         "product_types"
///     ],
///     "description": "The paginated list of product types."
/// }
library;

import 'exports.dart';
part 'store_product_type_list_response.freezed.dart';
part 'store_product_type_list_response.g.dart'; // StoreProductTypeListResponse

@freezed
abstract class StoreProductTypeListResponse
    with _$StoreProductTypeListResponse {
  const StoreProductTypeListResponse._();

  @jsonSerializable
  const factory StoreProductTypeListResponse({
    /// limit
    @JsonKey(name: StoreProductTypeListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: StoreProductTypeListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: StoreProductTypeListResponse.countKey) required int count,

    /// productTypes
    @JsonKey(name: StoreProductTypeListResponse.productTypesKey)
    required List<StoreProductType> productTypes,

    /// estimateCount
    @JsonKey(name: StoreProductTypeListResponse.estimateCountKey)
    required double estimateCount,
  }) = _StoreProductTypeListResponse;

  factory StoreProductTypeListResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreProductTypeListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String productTypesKey = r'product_types';

  static const String estimateCountKey = r'estimate_count';
}
