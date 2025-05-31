/// GetCollectionsQueryParameters
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
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the collection's deletion date."
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter the collection's searchable properties by.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a collection's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The collection's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by collection IDs."
///                 }
///             ]
///         },
///         "handle": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a collection's handle.",
///                     "title": "handle"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The collection's handle.",
///                         "title": "handle"
///                     },
///                     "description": "Filter by collection handles."
///                 }
///             ]
///         },
///         "title": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a collection's title.",
///                     "title": "title"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The collection's title.",
///                         "title": "title"
///                     },
///                     "description": "Filter by collection titles."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the collection's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the collection's update date."
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
part 'get_collections_query_parameters.freezed.dart';
part 'get_collections_query_parameters.g.dart'; // GetCollectionsQueryParameters

@freezed
abstract class GetCollectionsQueryParameters
    with _$GetCollectionsQueryParameters {
  const GetCollectionsQueryParameters._();

  @jsonSerializable
  const factory GetCollectionsQueryParameters({
    /// fields
    @JsonKey(name: GetCollectionsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetCollectionsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetCollectionsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetCollectionsQueryParameters.orderKey)
    required String order,

    /// deletedAt
    @JsonKey(name: GetCollectionsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// q
    @JsonKey(name: GetCollectionsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetCollectionsQueryParameters.idKey) required dynamic id,

    /// handle
    @JsonKey(name: GetCollectionsQueryParameters.handleKey)
    required dynamic handle,

    /// title
    @JsonKey(name: GetCollectionsQueryParameters.titleKey)
    required dynamic title,

    /// createdAt
    @JsonKey(name: GetCollectionsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetCollectionsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// and
    @JsonKey(name: GetCollectionsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetCollectionsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetCollectionsQueryParameters;

  factory GetCollectionsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetCollectionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String deletedAtKey = r'deleted_at';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String handleKey = r'handle';

  static const String titleKey = r'title';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
