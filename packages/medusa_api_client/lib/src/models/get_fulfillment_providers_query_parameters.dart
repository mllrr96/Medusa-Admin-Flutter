/// GetFulfillmentProvidersQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a fulfillment provider's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A fulfillment provider ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by fulfillment provider IDs."
///                 }
///             ]
///         },
///         "is_enabled": {
///             "type": "boolean",
///             "description": "Filter by whether the fulfillment provider is enabled.",
///             "title": "is_enabled"
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter a fulfillment provider's searchable properties.",
///             "title": "q"
///         },
///         "stock_location_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by associated stock location's ID.",
///                     "title": "stock_location_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A stock location's ID.",
///                         "title": "stock_location_id"
///                     },
///                     "description": "Filter by associated stock location IDs."
///                 }
///             ]
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_fulfillment_providers_query_parameters.freezed.dart';
part 'get_fulfillment_providers_query_parameters.g.dart'; // GetFulfillmentProvidersQueryParameters

@freezed
abstract class GetFulfillmentProvidersQueryParameters
    with _$GetFulfillmentProvidersQueryParameters {
  const GetFulfillmentProvidersQueryParameters._();

  @jsonSerializable
  const factory GetFulfillmentProvidersQueryParameters({
    /// fields
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.orderKey)
    required String order,

    /// id
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.idKey)
    required dynamic id,

    /// isEnabled
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.isEnabledKey)
    required bool isEnabled,

    /// q
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.qKey)
    required String q,

    /// stockLocationId
    @JsonKey(name: GetFulfillmentProvidersQueryParameters.stockLocationIdKey)
    required dynamic stockLocationId,
  }) = _GetFulfillmentProvidersQueryParameters;

  factory GetFulfillmentProvidersQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetFulfillmentProvidersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String idKey = r'id';

  static const String isEnabledKey = r'is_enabled';

  static const String qKey = r'q';

  static const String stockLocationIdKey = r'stock_location_id';
}
