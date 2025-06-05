/// AdminFulfillmentProviderListResponse
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
///         "fulfillment_providers": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminFulfillmentProvider"
///             },
///             "description": "The list of fulfillment providers."
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
///         "fulfillment_providers"
///     ],
///     "description": "The paginated list of fulfillment providers."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_provider_list_response.freezed.dart';
part 'admin_fulfillment_provider_list_response.g.dart'; // AdminFulfillmentProviderListResponse

@freezed
abstract class AdminFulfillmentProviderListResponse
    with _$AdminFulfillmentProviderListResponse {
  const AdminFulfillmentProviderListResponse._();

  @jsonSerializable
  const factory AdminFulfillmentProviderListResponse({
    /// limit
    @JsonKey(name: AdminFulfillmentProviderListResponse.limitKey)
    required int limit,

    /// offset
    @JsonKey(name: AdminFulfillmentProviderListResponse.offsetKey)
    required int offset,

    /// count
    @JsonKey(name: AdminFulfillmentProviderListResponse.countKey)
    required int count,

    /// fulfillmentProviders
    @JsonKey(name: AdminFulfillmentProviderListResponse.fulfillmentProvidersKey)
    required List<AdminFulfillmentProvider> fulfillmentProviders,

    /// estimateCount
    @JsonKey(name: AdminFulfillmentProviderListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminFulfillmentProviderListResponse;

  factory AdminFulfillmentProviderListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminFulfillmentProviderListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String fulfillmentProvidersKey = r'fulfillment_providers';

  static const String estimateCountKey = r'estimate_count';
}
