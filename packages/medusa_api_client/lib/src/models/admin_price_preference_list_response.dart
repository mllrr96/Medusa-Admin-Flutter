/// AdminPricePreferenceListResponse
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
///         "price_preferences": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPricePreference"
///             },
///             "description": "The list of price preferences."
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
///         "price_preferences"
///     ],
///     "description": "The paginated list of price preferences."
/// }
library;

import 'exports.dart';
part 'admin_price_preference_list_response.freezed.dart';
part 'admin_price_preference_list_response.g.dart'; // AdminPricePreferenceListResponse

@freezed
abstract class AdminPricePreferenceListResponse
    with _$AdminPricePreferenceListResponse {
  const AdminPricePreferenceListResponse._();

  @jsonSerializable
  const factory AdminPricePreferenceListResponse({
    /// limit
    @JsonKey(name: AdminPricePreferenceListResponse.limitKey)
    required double limit,

    /// offset
    @JsonKey(name: AdminPricePreferenceListResponse.offsetKey)
    required double offset,

    /// count
    @JsonKey(name: AdminPricePreferenceListResponse.countKey)
    required double count,

    /// pricePreferences
    @JsonKey(name: AdminPricePreferenceListResponse.pricePreferencesKey)
    required List<AdminPricePreference> pricePreferences,

    /// estimateCount
    @JsonKey(name: AdminPricePreferenceListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminPricePreferenceListResponse;

  factory AdminPricePreferenceListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPricePreferenceListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String pricePreferencesKey = r'price_preferences';

  static const String estimateCountKey = r'estimate_count';
}
