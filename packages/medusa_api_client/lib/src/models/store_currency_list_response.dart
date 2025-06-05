/// StoreCurrencyListResponse
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
///             "description": "The total count of items.",
///             "title": "count"
///         },
///         "currencies": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCurrency"
///             },
///             "description": "The list of currencies."
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
///         "currencies"
///     ],
///     "description": "The paginated list of currencies."
/// }
library;

import 'exports.dart';
part 'store_currency_list_response.freezed.dart';
part 'store_currency_list_response.g.dart'; // StoreCurrencyListResponse

@freezed
abstract class StoreCurrencyListResponse with _$StoreCurrencyListResponse {
  const StoreCurrencyListResponse._();

  @jsonSerializable
  const factory StoreCurrencyListResponse({
    /// limit
    @JsonKey(name: StoreCurrencyListResponse.limitKey) required int limit,

    /// offset
    @JsonKey(name: StoreCurrencyListResponse.offsetKey) required int offset,

    /// count
    @JsonKey(name: StoreCurrencyListResponse.countKey) required int count,

    /// currencies
    @JsonKey(name: StoreCurrencyListResponse.currenciesKey)
    required List<StoreCurrency> currencies,

    /// estimateCount
    @JsonKey(name: StoreCurrencyListResponse.estimateCountKey)
    required double estimateCount,
  }) = _StoreCurrencyListResponse;

  factory StoreCurrencyListResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreCurrencyListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String currenciesKey = r'currencies';

  static const String estimateCountKey = r'estimate_count';
}
