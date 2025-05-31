/// GetDraftOrdersQueryParameters
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
///                     "description": "Filter by a draft order's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A draft order's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by draft order IDs."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filter by conditions on the draft order's ID."
///                 }
///             ]
///         },
///         "status": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a draft order's status.",
///                     "title": "status"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The draft order status.",
///                         "title": "status"
///                     },
///                     "description": "Filter by draft order statuses."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filter by conditions on the status."
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
///             "description": "Filter by the associated sales channels to retrieve its draft orders."
///         },
///         "region_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The draft order's region id.",
///                     "title": "region_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The region id's details.",
///                         "title": "region_id"
///                     },
///                     "description": "The draft order's region id."
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
///             "description": "Filter by the draft order's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the draft order's update date."
///         },
///         "customer_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The draft order's customer id.",
///                     "title": "customer_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The customer id's details.",
///                         "title": "customer_id"
///                     },
///                     "description": "The draft order's customer id."
///                 }
///             ]
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_draft_orders_query_parameters.freezed.dart';
part 'get_draft_orders_query_parameters.g.dart'; // GetDraftOrdersQueryParameters

@freezed
abstract class GetDraftOrdersQueryParameters
    with _$GetDraftOrdersQueryParameters {
  const GetDraftOrdersQueryParameters._();

  @jsonSerializable
  const factory GetDraftOrdersQueryParameters({
    /// fields
    @JsonKey(name: GetDraftOrdersQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetDraftOrdersQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetDraftOrdersQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetDraftOrdersQueryParameters.orderKey)
    required String order,

    /// id
    @JsonKey(name: GetDraftOrdersQueryParameters.idKey) required dynamic id,

    /// status
    @JsonKey(name: GetDraftOrdersQueryParameters.statusKey)
    required dynamic status,

    /// and
    @JsonKey(name: GetDraftOrdersQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetDraftOrdersQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// salesChannelId
    @JsonKey(name: GetDraftOrdersQueryParameters.salesChannelIdKey)
    required List<String> salesChannelId,

    /// regionId
    @JsonKey(name: GetDraftOrdersQueryParameters.regionIdKey)
    required dynamic regionId,

    /// q
    @JsonKey(name: GetDraftOrdersQueryParameters.qKey) required String q,

    /// createdAt
    @JsonKey(name: GetDraftOrdersQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetDraftOrdersQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// customerId
    @JsonKey(name: GetDraftOrdersQueryParameters.customerIdKey)
    required dynamic customerId,
  }) = _GetDraftOrdersQueryParameters;

  factory GetDraftOrdersQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetDraftOrdersQueryParametersFromJson(json);

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
