/// GetCustomerGroupsQueryParameters
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
///             "description": "Search term to filter the customer group's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer group's IDs.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A customer group's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by customer group IDs."
///                 }
///             ]
///         },
///         "name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer group's name.",
///                     "title": "name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A customer group's name.",
///                         "title": "name"
///                     },
///                     "description": "Filter by customer group names."
///                 }
///             ]
///         },
///         "customers": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the ID of a customer to retrieve its groups.",
///                     "title": "customers"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A customer's ID.",
///                         "title": "customers"
///                     },
///                     "description": "Filter by customer IDs to retrieve their groups."
///                 },
///                 {
///                     "$ref": "#/components/schemas/AdminCustomerInGroupFilters"
///                 }
///             ]
///         },
///         "created_by": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an ID of a user to retrieve the customer groups they created.",
///                     "title": "created_by"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The user's ID.",
///                         "title": "created_by"
///                     },
///                     "description": "Filter by the IDs of users to retrieve the customer groups they created."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter the customer group by its creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter the customer groups by their update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter the customer groups by their deletion date."
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
part 'get_customer_groups_query_parameters.freezed.dart';
part 'get_customer_groups_query_parameters.g.dart'; // GetCustomerGroupsQueryParameters

@freezed
abstract class GetCustomerGroupsQueryParameters
    with _$GetCustomerGroupsQueryParameters {
  const GetCustomerGroupsQueryParameters._();

  @jsonSerializable
  const factory GetCustomerGroupsQueryParameters({
    /// fields
    @JsonKey(name: GetCustomerGroupsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetCustomerGroupsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetCustomerGroupsQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetCustomerGroupsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetCustomerGroupsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetCustomerGroupsQueryParameters.idKey) required dynamic id,

    /// name
    @JsonKey(name: GetCustomerGroupsQueryParameters.nameKey)
    required dynamic name,

    /// customers
    @JsonKey(name: GetCustomerGroupsQueryParameters.customersKey)
    required dynamic customers,

    /// createdBy
    @JsonKey(name: GetCustomerGroupsQueryParameters.createdByKey)
    required dynamic createdBy,

    /// createdAt
    @JsonKey(name: GetCustomerGroupsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetCustomerGroupsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetCustomerGroupsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetCustomerGroupsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetCustomerGroupsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetCustomerGroupsQueryParameters;

  factory GetCustomerGroupsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetCustomerGroupsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String customersKey = r'customers';

  static const String createdByKey = r'created_by';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
