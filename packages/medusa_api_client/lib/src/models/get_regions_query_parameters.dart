/// GetRegionsQueryParameters
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
///             "description": "Search term to filter the region's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a region's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A region's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by region IDs."
///                 }
///             ]
///         },
///         "name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a region's name.",
///                     "title": "name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A region's name.",
///                         "title": "name"
///                     },
///                     "description": "Filter by region names."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a region's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a region's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a region's deletion date."
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
///         "currency_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The region's currency code.",
///                     "title": "currency_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The currency code's details.",
///                         "title": "currency_code"
///                     },
///                     "description": "The region's currency code."
///                 }
///             ]
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_regions_query_parameters.freezed.dart';
part 'get_regions_query_parameters.g.dart'; // GetRegionsQueryParameters

@freezed
abstract class GetRegionsQueryParameters with _$GetRegionsQueryParameters {
  const GetRegionsQueryParameters._();

  @jsonSerializable
  const factory GetRegionsQueryParameters({
    /// fields
    @JsonKey(name: GetRegionsQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetRegionsQueryParameters.offsetKey) required double offset,

    /// limit
    @JsonKey(name: GetRegionsQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetRegionsQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetRegionsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetRegionsQueryParameters.idKey) required dynamic id,

    /// name
    @JsonKey(name: GetRegionsQueryParameters.nameKey) required dynamic name,

    /// createdAt
    @JsonKey(name: GetRegionsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetRegionsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetRegionsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetRegionsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetRegionsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// currencyCode
    @JsonKey(name: GetRegionsQueryParameters.currencyCodeKey)
    required dynamic currencyCode,
  }) = _GetRegionsQueryParameters;

  factory GetRegionsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetRegionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';

  static const String currencyCodeKey = r'currency_code';
}
