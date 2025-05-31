/// GetStoresQueryParameters
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
///             "description": "Search term to filter the store's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a store ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A store ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by store IDs."
///                 }
///             ]
///         },
///         "name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a store name.",
///                     "title": "name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A store name.",
///                         "title": "name"
///                     },
///                     "description": "Filter by store names."
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
library get_stores_query_parameters;

import 'exports.dart';
part 'get_stores_query_parameters.freezed.dart';
part 'get_stores_query_parameters.g.dart'; // GetStoresQueryParameters

@freezed
abstract class GetStoresQueryParameters with _$GetStoresQueryParameters {
  const GetStoresQueryParameters._();

  @jsonSerializable
  const factory GetStoresQueryParameters({
    /// fields
    @JsonKey(name: GetStoresQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetStoresQueryParameters.offsetKey) required double offset,

    /// limit
    @JsonKey(name: GetStoresQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetStoresQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetStoresQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetStoresQueryParameters.idKey) required dynamic id,

    /// name
    @JsonKey(name: GetStoresQueryParameters.nameKey) required dynamic name,

    /// and
    @JsonKey(name: GetStoresQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetStoresQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetStoresQueryParameters;

  factory GetStoresQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetStoresQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
