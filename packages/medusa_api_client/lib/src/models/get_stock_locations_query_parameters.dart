/// GetStockLocationsQueryParameters
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
///         "q": {
///             "type": "string",
///             "description": "Search term to filter the stock location's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a stock location ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A stock location ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by stock location IDs."
///                 }
///             ]
///         },
///         "name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a stock location name.",
///                     "title": "name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A stock location name.",
///                         "title": "name"
///                     },
///                     "description": "Filter by stock location names."
///                 }
///             ]
///         },
///         "address_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an address ID to retrieve its associated locations.",
///                     "title": "address_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An address ID.",
///                         "title": "address_id"
///                     },
///                     "description": "Filter by address IDs to retrieve their associated locations."
///                 }
///             ]
///         },
///         "sales_channel_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a sales channel ID to retrieve its associated locations.",
///                     "title": "sales_channel_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A sales channel ID",
///                         "title": "sales_channel_id"
///                     },
///                     "description": "Filter by sales channel IDs to retrieve their associated locations."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a stock location's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a stock location's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a stock location's deletion date."
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
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_stock_locations_query_parameters.freezed.dart';
part 'get_stock_locations_query_parameters.g.dart'; // GetStockLocationsQueryParameters

@freezed
abstract class GetStockLocationsQueryParameters
    with _$GetStockLocationsQueryParameters {
  const GetStockLocationsQueryParameters._();

  @jsonSerializable
  const factory GetStockLocationsQueryParameters({
    /// fields
    @JsonKey(name: GetStockLocationsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetStockLocationsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetStockLocationsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetStockLocationsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetStockLocationsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetStockLocationsQueryParameters.idKey) required dynamic id,

    /// name
    @JsonKey(name: GetStockLocationsQueryParameters.nameKey)
    required dynamic name,

    /// addressId
    @JsonKey(name: GetStockLocationsQueryParameters.addressIdKey)
    required dynamic addressId,

    /// salesChannelId
    @JsonKey(name: GetStockLocationsQueryParameters.salesChannelIdKey)
    required dynamic salesChannelId,

    /// createdAt
    @JsonKey(name: GetStockLocationsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetStockLocationsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetStockLocationsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetStockLocationsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetStockLocationsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetStockLocationsQueryParameters;

  factory GetStockLocationsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetStockLocationsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String addressIdKey = r'address_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
