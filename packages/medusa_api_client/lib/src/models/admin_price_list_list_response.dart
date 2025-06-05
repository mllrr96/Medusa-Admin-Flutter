/// AdminPriceListListResponse
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
///         "price_lists": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPriceList"
///             },
///             "description": "The list of price lists."
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
///         "price_lists"
///     ],
///     "description": "The paginated list of price lists."
/// }
library;

import 'exports.dart';
part 'admin_price_list_list_response.freezed.dart';
part 'admin_price_list_list_response.g.dart'; // AdminPriceListListResponse

@freezed
abstract class AdminPriceListListResponse with _$AdminPriceListListResponse {
  const AdminPriceListListResponse._();

  @jsonSerializable
  const factory AdminPriceListListResponse({
    /// limit
    @JsonKey(name: AdminPriceListListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: AdminPriceListListResponse.offsetKey) required int offset,

    /// count
    @JsonKey(name: AdminPriceListListResponse.countKey) required int count,

    /// priceLists
    @JsonKey(name: AdminPriceListListResponse.priceListsKey)
    required List<AdminPriceList> priceLists,

    /// estimateCount
    @JsonKey(name: AdminPriceListListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminPriceListListResponse;

  factory AdminPriceListListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPriceListListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String priceListsKey = r'price_lists';

  static const String estimateCountKey = r'estimate_count';
}
