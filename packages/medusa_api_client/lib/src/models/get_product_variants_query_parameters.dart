/// GetProductVariantsQueryParameters
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
///             "description": "Search term to filter the product variant's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a variant's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A variant's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by variant IDs."
///                 }
///             ]
///         },
///         "manage_inventory": {
///             "type": "boolean",
///             "description": "Filter by whether a variant's `manage_inventory` is enabled.",
///             "title": "manage_inventory"
///         },
///         "allow_backorder": {
///             "type": "boolean",
///             "description": "Filter by whether backorder is allowed for a variant.",
///             "title": "allow_backorder"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the product variant's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the product variant's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the product variant's deletion date."
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
part 'get_product_variants_query_parameters.freezed.dart';
part 'get_product_variants_query_parameters.g.dart'; // GetProductVariantsQueryParameters

@freezed
abstract class GetProductVariantsQueryParameters
    with _$GetProductVariantsQueryParameters {
  const GetProductVariantsQueryParameters._();

  @jsonSerializable
  const factory GetProductVariantsQueryParameters({
    /// fields
    @JsonKey(name: GetProductVariantsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetProductVariantsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetProductVariantsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetProductVariantsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetProductVariantsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetProductVariantsQueryParameters.idKey) required dynamic id,

    /// manageInventory
    @JsonKey(name: GetProductVariantsQueryParameters.manageInventoryKey)
    required bool manageInventory,

    /// allowBackorder
    @JsonKey(name: GetProductVariantsQueryParameters.allowBackorderKey)
    required bool allowBackorder,

    /// createdAt
    @JsonKey(name: GetProductVariantsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetProductVariantsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetProductVariantsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetProductVariantsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetProductVariantsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetProductVariantsQueryParameters;

  factory GetProductVariantsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetProductVariantsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String manageInventoryKey = r'manage_inventory';

  static const String allowBackorderKey = r'allow_backorder';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
