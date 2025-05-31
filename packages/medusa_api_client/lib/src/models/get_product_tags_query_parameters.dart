/// GetProductTagsQueryParameters
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
///             "description": "Search term to filter the product tag's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product tag's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product tag's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by product tag IDs."
///                 }
///             ]
///         },
///         "value": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product tag's value.",
///                     "title": "value"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A tag value.",
///                         "title": "value"
///                     },
///                     "description": "Filter by product tag values."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the tag's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the tag's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the tag's deletion date."
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
part 'get_product_tags_query_parameters.freezed.dart';
part 'get_product_tags_query_parameters.g.dart'; // GetProductTagsQueryParameters

@freezed
abstract class GetProductTagsQueryParameters
    with _$GetProductTagsQueryParameters {
  const GetProductTagsQueryParameters._();

  @jsonSerializable
  const factory GetProductTagsQueryParameters({
    /// fields
    @JsonKey(name: GetProductTagsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetProductTagsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetProductTagsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetProductTagsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetProductTagsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetProductTagsQueryParameters.idKey) required dynamic id,

    /// value
    @JsonKey(name: GetProductTagsQueryParameters.valueKey)
    required dynamic value,

    /// createdAt
    @JsonKey(name: GetProductTagsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetProductTagsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetProductTagsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetProductTagsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetProductTagsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetProductTagsQueryParameters;

  factory GetProductTagsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProductTagsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
