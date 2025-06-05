/// GetOrdersQueryParameters
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
///                     "description": "Filter by an order ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An order's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by order IDs."
///                 }
///             ]
///         },
///         "status": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the order's status.",
///                     "title": "status"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An order's status.",
///                         "title": "status"
///                     },
///                     "description": "Filter by order statuses."
///                 }
///             ]
///         },
///         "$and": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an AND condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$and"
///         },
///         "$or": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an OR condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$or"
///         },
///         "sales_channel_id": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A sales channel's ID.",
///                 "title": "sales_channel_id"
///             },
///             "description": "Filter by sales channel IDs to retrieve the orders associated with them."
///         },
///         "region_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The order's region id.",
///                     "title": "region_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The region id's details.",
///                         "title": "region_id"
///                     },
///                     "description": "The order's region id."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter the order's searchable properties.",
///             "title": "q"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the order's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the order's update date."
///         },
///         "customer_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The order's customer id.",
///                     "title": "customer_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The customer id's details.",
///                         "title": "customer_id"
///                     },
///                     "description": "The order's customer id."
///                 }
///             ]
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_orders_query_parameters.freezed.dart';
part 'get_orders_query_parameters.g.dart'; // GetOrdersQueryParameters

@freezed
abstract class GetOrdersQueryParameters with _$GetOrdersQueryParameters {
  const GetOrdersQueryParameters._();

  @jsonSerializable
  const factory GetOrdersQueryParameters({
    /// fields
    @JsonKey(name: GetOrdersQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetOrdersQueryParameters.offsetKey) required int offset,

    /// limit
    @JsonKey(name: GetOrdersQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetOrdersQueryParameters.orderKey) required String order,

    /// id
    @JsonKey(name: GetOrdersQueryParameters.idKey) required dynamic id,

    /// status
    @JsonKey(name: GetOrdersQueryParameters.statusKey) required dynamic status,

    /// and
    @JsonKey(name: GetOrdersQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetOrdersQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// salesChannelId
    @JsonKey(name: GetOrdersQueryParameters.salesChannelIdKey)
    required List<String> salesChannelId,

    /// regionId
    @JsonKey(name: GetOrdersQueryParameters.regionIdKey)
    required dynamic regionId,

    /// q
    @JsonKey(name: GetOrdersQueryParameters.qKey) required String q,

    /// createdAt
    @JsonKey(name: GetOrdersQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetOrdersQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// customerId
    @JsonKey(name: GetOrdersQueryParameters.customerIdKey)
    required dynamic customerId,
  }) = _GetOrdersQueryParameters;

  factory GetOrdersQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String idKey = r'id';

  static const String statusKey = r'status';

  static const String andKey = r'$and';

  static const String orKey = r'$or';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String regionIdKey = r'region_id';

  static const String qKey = r'q';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String customerIdKey = r'customer_id';
}
