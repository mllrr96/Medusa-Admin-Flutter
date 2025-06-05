/// GetTaxRegionsQueryParameters
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
///             "description": "Search term to filter a tax region's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a tax region ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A tax region ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by tax region IDs."
///                 }
///             ]
///         },
///         "country_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a country code.",
///                     "title": "country_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A country code.",
///                         "title": "country_code"
///                     },
///                     "description": "Filter by country codes."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the currency code."
///                 }
///             ]
///         },
///         "province_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a ISO 3166-2 province code. Must be lower-case.",
///                     "title": "province_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A ISO 3166-2 province code.",
///                         "title": "province_code"
///                     },
///                     "description": "Filter by ISO 3166-2 province codes."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the province code."
///                 }
///             ]
///         },
///         "parent_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the ID of a parent tax region to retrieve its child tax regions.",
///                     "title": "parent_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A tax region's ID.",
///                         "title": "parent_id"
///                     },
///                     "description": "Filter by the IDs of parent tax regions to retrieve their child tax regions."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the parent tax region's ID to retrieve its child tax regions."
///                 }
///             ]
///         },
///         "created_by": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the ID of the user to retrieve the tax regions they created.",
///                     "title": "created_by"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A user ID.",
///                         "title": "created_by"
///                     },
///                     "description": "Filter by user IDs to retrieve their tax regions they created."
///                 }
///             ]
///         },
///         "created_at": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a tax region's creation date.",
///                     "title": "created_at"
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the tax region's creation date."
///                 }
///             ]
///         },
///         "updated_at": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a tax region's update date.",
///                     "title": "updated_at"
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the tax region's update date."
///                 }
///             ]
///         },
///         "deleted_at": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a tax region's deletion date.",
///                     "title": "deleted_at"
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the tax region's deletion date."
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
part 'get_tax_regions_query_parameters.freezed.dart';
part 'get_tax_regions_query_parameters.g.dart'; // GetTaxRegionsQueryParameters

@freezed
abstract class GetTaxRegionsQueryParameters
    with _$GetTaxRegionsQueryParameters {
  const GetTaxRegionsQueryParameters._();

  @jsonSerializable
  const factory GetTaxRegionsQueryParameters({
    /// fields
    @JsonKey(name: GetTaxRegionsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetTaxRegionsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetTaxRegionsQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetTaxRegionsQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetTaxRegionsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetTaxRegionsQueryParameters.idKey) required dynamic id,

    /// countryCode
    @JsonKey(name: GetTaxRegionsQueryParameters.countryCodeKey)
    required dynamic countryCode,

    /// provinceCode
    @JsonKey(name: GetTaxRegionsQueryParameters.provinceCodeKey)
    required dynamic provinceCode,

    /// parentId
    @JsonKey(name: GetTaxRegionsQueryParameters.parentIdKey)
    required dynamic parentId,

    /// createdBy
    @JsonKey(name: GetTaxRegionsQueryParameters.createdByKey)
    required dynamic createdBy,

    /// createdAt
    @JsonKey(name: GetTaxRegionsQueryParameters.createdAtKey)
    required dynamic createdAt,

    /// updatedAt
    @JsonKey(name: GetTaxRegionsQueryParameters.updatedAtKey)
    required dynamic updatedAt,

    /// deletedAt
    @JsonKey(name: GetTaxRegionsQueryParameters.deletedAtKey)
    required dynamic deletedAt,

    /// and
    @JsonKey(name: GetTaxRegionsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetTaxRegionsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetTaxRegionsQueryParameters;

  factory GetTaxRegionsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetTaxRegionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String countryCodeKey = r'country_code';

  static const String provinceCodeKey = r'province_code';

  static const String parentIdKey = r'parent_id';

  static const String createdByKey = r'created_by';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
