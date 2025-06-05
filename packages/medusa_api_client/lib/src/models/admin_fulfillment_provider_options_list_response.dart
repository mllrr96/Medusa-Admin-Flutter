/// AdminFulfillmentProviderOptionsListResponse
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
///         "fulfillment_options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminFulfillmentProviderOption"
///             },
///             "description": "The list of fulfillment options."
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
///         "fulfillment_options"
///     ],
///     "description": "The paginated list of fulfillment options."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_provider_options_list_response.freezed.dart';
part 'admin_fulfillment_provider_options_list_response.g.dart'; // AdminFulfillmentProviderOptionsListResponse

@freezed
abstract class AdminFulfillmentProviderOptionsListResponse
    with _$AdminFulfillmentProviderOptionsListResponse {
  const AdminFulfillmentProviderOptionsListResponse._();

  @jsonSerializable
  const factory AdminFulfillmentProviderOptionsListResponse({
    /// limit
    @JsonKey(name: AdminFulfillmentProviderOptionsListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: AdminFulfillmentProviderOptionsListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminFulfillmentProviderOptionsListResponse.countKey)
    required int count,

    /// fulfillmentOptions
    @JsonKey(
      name: AdminFulfillmentProviderOptionsListResponse.fulfillmentOptionsKey,
    )
    required List<AdminFulfillmentProviderOption> fulfillmentOptions,

    /// estimateCount
    @JsonKey(name: AdminFulfillmentProviderOptionsListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminFulfillmentProviderOptionsListResponse;

  factory AdminFulfillmentProviderOptionsListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminFulfillmentProviderOptionsListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String fulfillmentOptionsKey = r'fulfillment_options';

  static const String estimateCountKey = r'estimate_count';
}
