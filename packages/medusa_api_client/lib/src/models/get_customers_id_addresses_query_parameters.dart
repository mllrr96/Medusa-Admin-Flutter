/// GetCustomersIdAddressesQueryParameters
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
///         "q": {
///             "type": "string",
///             "description": "Search term to apply on the address's searchable properties.",
///             "title": "q"
///         },
///         "company": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a company.",
///                     "title": "company"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A company's name.",
///                         "title": "company"
///                     },
///                     "description": "Filter by companies."
///                 }
///             ]
///         },
///         "city": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a city.",
///                     "title": "city"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A city's name.",
///                         "title": "city"
///                     },
///                     "description": "Filter by cities."
///                 }
///             ]
///         },
///         "country_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a currency code.",
///                     "title": "country_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A currency code.",
///                         "title": "country_code"
///                     },
///                     "description": "Filter by currency codes."
///                 }
///             ]
///         },
///         "province": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an ISO 3166-2 province code. Must be lower-case.",
///                     "title": "province"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A ISO 3166-2 province code. Must be lower-case.",
///                         "title": "province"
///                     },
///                     "description": "Filter by ISO 3166-2 provinces."
///                 }
///             ]
///         },
///         "postal_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a postal code.",
///                     "title": "postal_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A postal code.",
///                         "title": "postal_code"
///                     },
///                     "description": "Filter by postal codes."
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
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_customers_id_addresses_query_parameters.freezed.dart';
part 'get_customers_id_addresses_query_parameters.g.dart'; // GetCustomersIdAddressesQueryParameters

@freezed
abstract class GetCustomersIdAddressesQueryParameters
    with _$GetCustomersIdAddressesQueryParameters {
  const GetCustomersIdAddressesQueryParameters._();

  @jsonSerializable
  const factory GetCustomersIdAddressesQueryParameters({
    /// fields
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.qKey)
    required String q,

    /// company
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.companyKey)
    required dynamic company,

    /// city
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.cityKey)
    required dynamic city,

    /// countryCode
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.countryCodeKey)
    required dynamic countryCode,

    /// province
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.provinceKey)
    required dynamic province,

    /// postalCode
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.postalCodeKey)
    required dynamic postalCode,

    /// and
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetCustomersIdAddressesQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetCustomersIdAddressesQueryParameters;

  factory GetCustomersIdAddressesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetCustomersIdAddressesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String companyKey = r'company';

  static const String cityKey = r'city';

  static const String countryCodeKey = r'country_code';

  static const String provinceKey = r'province';

  static const String postalCodeKey = r'postal_code';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
