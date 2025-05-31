/// GetCustomersQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields. This API route restricts the fields that can be selected. Learn how to override the retrievable fields in the [Retrieve Custom Links](https://docs.medusajs.com/learn/fundamentals/api-routes/retrieve-custom-links) documentation.",
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
///         "groups": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer group's ID to retrieve customers that belong to it.",
///                     "title": "groups"
///                 },
///                 {
///                     "$ref": "#/components/schemas/CustomerGroupInCustomerFilters"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The customer group's ID.",
///                         "title": "groups"
///                     },
///                     "description": "Filter by customer group IDs to retrieve customers that belong to them."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter the customer's searchable properties by.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A customer's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by customer IDs."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filters to apply on the customer ID."
///                 }
///             ]
///         },
///         "email": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "format": "email",
///                     "description": "Filter by a customer email.",
///                     "title": "email"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "format": "email",
///                         "description": "A customer's email.",
///                         "title": "email"
///                     },
///                     "description": "Filter by customer emails."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filter by conditions on the customer email."
///                 }
///             ]
///         },
///         "company_name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's company name.",
///                     "title": "company_name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The customer's company name.",
///                         "title": "company_name"
///                     },
///                     "description": "Filter by customer company names."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filter by conditions on the customer's company name."
///                 }
///             ]
///         },
///         "first_name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's first name.",
///                     "title": "first_name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A customer's first name.",
///                         "title": "first_name"
///                     },
///                     "description": "Filter by customer first names."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filter by conditions on the first name."
///                 }
///             ]
///         },
///         "last_name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a customer's last name.",
///                     "title": "last_name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A customer's last name.",
///                         "title": "last_name"
///                     },
///                     "description": "Filter by customer last names."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filter by conditions on a customer's last name."
///                 }
///             ]
///         },
///         "created_by": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a user ID to retrieve the customers they created.",
///                     "title": "created_by"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A user's ID.",
///                         "title": "created_by"
///                     },
///                     "description": "Filter by user IDs to retrieve customers they created."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Filter by conditions on the user ID that created the customer."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the customer's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a customer's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter a customer by their deletion date."
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
///         "has_account": {
///             "type": "boolean",
///             "description": "Filter by whether the customer is registered.",
///             "title": "has_account"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_customers_query_parameters.freezed.dart';
part 'get_customers_query_parameters.g.dart'; // GetCustomersQueryParameters

@freezed
abstract class GetCustomersQueryParameters with _$GetCustomersQueryParameters {
  const GetCustomersQueryParameters._();

  @jsonSerializable
  const factory GetCustomersQueryParameters({
    /// fields
    @JsonKey(name: GetCustomersQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetCustomersQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetCustomersQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetCustomersQueryParameters.orderKey) required String order,

    /// groups
    @JsonKey(name: GetCustomersQueryParameters.groupsKey)
    required dynamic groups,

    /// q
    @JsonKey(name: GetCustomersQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetCustomersQueryParameters.idKey) required dynamic id,

    /// email
    @JsonKey(name: GetCustomersQueryParameters.emailKey) required dynamic email,

    /// companyName
    @JsonKey(name: GetCustomersQueryParameters.companyNameKey)
    required dynamic companyName,

    /// firstName
    @JsonKey(name: GetCustomersQueryParameters.firstNameKey)
    required dynamic firstName,

    /// lastName
    @JsonKey(name: GetCustomersQueryParameters.lastNameKey)
    required dynamic lastName,

    /// createdBy
    @JsonKey(name: GetCustomersQueryParameters.createdByKey)
    required dynamic createdBy,

    /// createdAt
    @JsonKey(name: GetCustomersQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetCustomersQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetCustomersQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetCustomersQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetCustomersQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// hasAccount
    @JsonKey(name: GetCustomersQueryParameters.hasAccountKey)
    required bool hasAccount,
  }) = _GetCustomersQueryParameters;

  factory GetCustomersQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetCustomersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String groupsKey = r'groups';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String emailKey = r'email';

  static const String companyNameKey = r'company_name';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String createdByKey = r'created_by';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';

  static const String hasAccountKey = r'has_account';
}
