/// GetProductsIdOptionsQueryParameters
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
///             "description": "Search term to filter the product option's searchable fields.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the product option's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product option's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by product option IDs."
///                 }
///             ]
///         },
///         "title": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a title.",
///                     "title": "title"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An option's title.",
///                         "title": "title"
///                     },
///                     "description": "Filter by titles."
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
part 'get_products_id_options_query_parameters.freezed.dart';
part 'get_products_id_options_query_parameters.g.dart'; // GetProductsIdOptionsQueryParameters

@freezed
abstract class GetProductsIdOptionsQueryParameters
    with _$GetProductsIdOptionsQueryParameters {
  const GetProductsIdOptionsQueryParameters._();

  @jsonSerializable
  const factory GetProductsIdOptionsQueryParameters({
    /// fields
    @JsonKey(name: GetProductsIdOptionsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetProductsIdOptionsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetProductsIdOptionsQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetProductsIdOptionsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetProductsIdOptionsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetProductsIdOptionsQueryParameters.idKey)
    required dynamic id,

    /// title
    @JsonKey(name: GetProductsIdOptionsQueryParameters.titleKey)
    required dynamic title,

    /// and
    @JsonKey(name: GetProductsIdOptionsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetProductsIdOptionsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetProductsIdOptionsQueryParameters;

  factory GetProductsIdOptionsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetProductsIdOptionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
