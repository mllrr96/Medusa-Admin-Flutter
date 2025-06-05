/// AdminStockLocationListResponse
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
///         "stock_locations": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminStockLocation"
///             },
///             "description": "The list of stock locations."
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
///         "stock_locations"
///     ],
///     "description": "The paginated list of stock locations."
/// }
library;

import 'exports.dart';
part 'admin_stock_location_list_response.freezed.dart';
part 'admin_stock_location_list_response.g.dart'; // AdminStockLocationListResponse

@freezed
abstract class AdminStockLocationListResponse
    with _$AdminStockLocationListResponse {
  const AdminStockLocationListResponse._();

  @jsonSerializable
  const factory AdminStockLocationListResponse({
    /// limit
    @JsonKey(name: AdminStockLocationListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: AdminStockLocationListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminStockLocationListResponse.countKey)
    required int count,

    /// stockLocations
    @JsonKey(name: AdminStockLocationListResponse.stockLocationsKey)
    required List<AdminStockLocation> stockLocations,

    /// estimateCount
    @JsonKey(name: AdminStockLocationListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminStockLocationListResponse;

  factory AdminStockLocationListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminStockLocationListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String stockLocationsKey = r'stock_locations';

  static const String estimateCountKey = r'estimate_count';
}
