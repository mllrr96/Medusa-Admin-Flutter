/// AdminProductTypeListResponse
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
///         "product_types": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductType"
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
part 'admin_product_type_list_response.freezed.dart';
part 'admin_product_type_list_response.g.dart'; // AdminProductTypeListResponse

@freezed
abstract class AdminProductTypeListResponse
    with _$AdminProductTypeListResponse {
  const AdminProductTypeListResponse._();

  @jsonSerializable
  const factory AdminProductTypeListResponse({
    /// limit
    @JsonKey(name: AdminProductTypeListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: AdminProductTypeListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminProductTypeListResponse.countKey) required int count,

    /// productTypes
    @JsonKey(name: AdminProductTypeListResponse.productTypesKey)
    required List<AdminProductType> productTypes,

    /// estimateCount
    @JsonKey(name: AdminProductTypeListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminProductTypeListResponse;

  factory AdminProductTypeListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTypeListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String productTypesKey = r'product_types';

  static const String estimateCountKey = r'estimate_count';
}
