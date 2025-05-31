/// GetProductCategoriesQueryParameters
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
///             "description": "Search term to filter on the product category's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a product category's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A product category ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by product category IDs."
///                 }
///             ]
///         },
///         "description": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the category's description. This performs a full-text search. To do keyword search, use the `q` parameter instead.",
///                     "title": "description"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The category's description.",
///                         "title": "description"
///                     },
///                     "description": "Filter by category descriptions. This performs a full-text search. To do keyword search, use the `q` parameter instead."
///                 }
///             ]
///         },
///         "handle": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a category's handle.",
///                     "title": "handle"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A category's handle.",
///                         "title": "handle"
///                     },
///                     "description": "Filter by category handles."
///                 }
///             ]
///         },
///         "parent_category_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a parent category's ID to retrieve its child categories.",
///                     "title": "parent_category_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A parent category's ID.",
///                         "title": "parent_category_id"
///                     },
///                     "description": "Filter by parent category IDs to retrieve their child categories."
///                 }
///             ]
///         },
///         "include_ancestors_tree": {
///             "type": "boolean",
///             "description": "Whether to include the parent category of each category. If you enable this, add to the `fields` query parameter `parent_category` to set the parent of a category in this field. You can either pass `*parent_category` to retreieve the fields of all parent categories, or select specific fields to make the response size smaller. For example, `fields=parent_category.id,parent_category.name`.",
///             "title": "include_ancestors_tree"
///         },
///         "include_descendants_tree": {
///             "type": "boolean",
///             "description": "Whether to include the child categories of each category. If you enable this, add to the `fields` query parameter `category_children` to set the children of a category in this field. You can either pass `*category_children` to retreieve the fields of all child categories, or select specific fields to make the response size smaller. For example, `fields=category_children.id,category_children.name`.",
///             "title": "include_descendants_tree"
///         },
///         "is_internal": {
///             "type": "boolean",
///             "description": "Filter by whether the category is internal.",
///             "title": "is_internal"
///         },
///         "is_active": {
///             "type": "boolean",
///             "description": "Filter by whether the category is active.",
///             "title": "is_active"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the category's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the category's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the category's deletion date."
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
///         "name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The product category's name.",
///                     "title": "name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The name's details.",
///                         "title": "name"
///                     },
///                     "description": "The product category's name."
///                 }
///             ]
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_product_categories_query_parameters.freezed.dart';
part 'get_product_categories_query_parameters.g.dart'; // GetProductCategoriesQueryParameters

@freezed
abstract class GetProductCategoriesQueryParameters
    with _$GetProductCategoriesQueryParameters {
  const GetProductCategoriesQueryParameters._();

  @jsonSerializable
  const factory GetProductCategoriesQueryParameters({
    /// fields
    @JsonKey(name: GetProductCategoriesQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetProductCategoriesQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetProductCategoriesQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetProductCategoriesQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetProductCategoriesQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetProductCategoriesQueryParameters.idKey)
    required dynamic id,

    /// description
    @JsonKey(name: GetProductCategoriesQueryParameters.descriptionKey)
    required dynamic description,

    /// handle
    @JsonKey(name: GetProductCategoriesQueryParameters.handleKey)
    required dynamic handle,

    /// parentCategoryId
    @JsonKey(name: GetProductCategoriesQueryParameters.parentCategoryIdKey)
    required dynamic parentCategoryId,

    /// includeAncestorsTree
    @JsonKey(name: GetProductCategoriesQueryParameters.includeAncestorsTreeKey)
    required bool includeAncestorsTree,

    /// includeDescendantsTree
    @JsonKey(
      name: GetProductCategoriesQueryParameters.includeDescendantsTreeKey,
    )
    required bool includeDescendantsTree,

    /// isInternal
    @JsonKey(name: GetProductCategoriesQueryParameters.isInternalKey)
    required bool isInternal,

    /// isActive
    @JsonKey(name: GetProductCategoriesQueryParameters.isActiveKey)
    required bool isActive,

    /// createdAt
    @JsonKey(name: GetProductCategoriesQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetProductCategoriesQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetProductCategoriesQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetProductCategoriesQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetProductCategoriesQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// name
    @JsonKey(name: GetProductCategoriesQueryParameters.nameKey)
    required dynamic name,
  }) = _GetProductCategoriesQueryParameters;

  factory GetProductCategoriesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetProductCategoriesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String descriptionKey = r'description';

  static const String handleKey = r'handle';

  static const String parentCategoryIdKey = r'parent_category_id';

  static const String includeAncestorsTreeKey = r'include_ancestors_tree';

  static const String includeDescendantsTreeKey = r'include_descendants_tree';

  static const String isInternalKey = r'is_internal';

  static const String isActiveKey = r'is_active';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';

  static const String nameKey = r'name';
}
