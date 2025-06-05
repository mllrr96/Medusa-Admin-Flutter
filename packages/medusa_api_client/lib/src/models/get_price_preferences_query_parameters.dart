/// GetPricePreferencesQueryParameters
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
///                     "description": "Filter by a price preference ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A price preference ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by price preference IDs."
///                 }
///             ]
///         },
///         "attribute": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a price preference's attribute.",
///                     "title": "attribute"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A price preference's attribute.",
///                         "title": "attribute"
///                     },
///                     "description": "Filter by price preference attributes."
///                 }
///             ]
///         },
///         "value": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a price preference's value.",
///                     "title": "value"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A price preference's value.",
///                         "title": "value"
///                     },
///                     "description": "Filter by price preference values."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to apply on the price preference's searchable properties.",
///             "title": "q"
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
part 'get_price_preferences_query_parameters.freezed.dart';
part 'get_price_preferences_query_parameters.g.dart'; // GetPricePreferencesQueryParameters

@freezed
abstract class GetPricePreferencesQueryParameters
    with _$GetPricePreferencesQueryParameters {
  const GetPricePreferencesQueryParameters._();

  @jsonSerializable
  const factory GetPricePreferencesQueryParameters({
    /// fields
    @JsonKey(name: GetPricePreferencesQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetPricePreferencesQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetPricePreferencesQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetPricePreferencesQueryParameters.orderKey)
    required String order,

    /// id
    @JsonKey(name: GetPricePreferencesQueryParameters.idKey)
    required dynamic id,

    /// attribute
    @JsonKey(name: GetPricePreferencesQueryParameters.attributeKey)
    required dynamic attribute,

    /// value
    @JsonKey(name: GetPricePreferencesQueryParameters.valueKey)
    required dynamic value,

    /// q
    @JsonKey(name: GetPricePreferencesQueryParameters.qKey) required String q,

    /// and
    @JsonKey(name: GetPricePreferencesQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetPricePreferencesQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetPricePreferencesQueryParameters;

  factory GetPricePreferencesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetPricePreferencesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String idKey = r'id';

  static const String attributeKey = r'attribute';

  static const String valueKey = r'value';

  static const String qKey = r'q';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
