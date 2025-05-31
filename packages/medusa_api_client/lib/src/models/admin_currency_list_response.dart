/// AdminCurrencyListResponse
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
///         "currencies": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCurrency"
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
part 'admin_currency_list_response.freezed.dart';
part 'admin_currency_list_response.g.dart'; // AdminCurrencyListResponse

@freezed
abstract class AdminCurrencyListResponse with _$AdminCurrencyListResponse {
  const AdminCurrencyListResponse._();

  @jsonSerializable
  const factory AdminCurrencyListResponse({
    /// limit
    @JsonKey(name: AdminCurrencyListResponse.limitKey) required double limit,

    /// offset
    @JsonKey(name: AdminCurrencyListResponse.offsetKey) required double offset,

    /// count
    @JsonKey(name: AdminCurrencyListResponse.countKey) required double count,

    /// currencies
    @JsonKey(name: AdminCurrencyListResponse.currenciesKey)
    required List<AdminCurrency> currencies,

    /// estimateCount
    @JsonKey(name: AdminCurrencyListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminCurrencyListResponse;

  factory AdminCurrencyListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCurrencyListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String currenciesKey = r'currencies';

  static const String estimateCountKey = r'estimate_count';
}
