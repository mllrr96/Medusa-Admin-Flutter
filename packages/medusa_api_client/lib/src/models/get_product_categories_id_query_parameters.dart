/// GetProductCategoriesIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields. This API route restricts the fields that can be selected. Learn how to override the retrievable fields in the [Retrieve Custom Links](https://docs.medusajs.com/learn/fundamentals/api-routes/retrieve-custom-links) documentation.",
///             "title": "fields"
///         },
///         "include_ancestors_tree": {
///             "type": "boolean",
///             "description": "Whether to retrieve the category's parent. If you enable this, add to the `fields` query parameter `parent_category` to set the parent of a category in this field. You can either pass `*parent_category` to retreieve the fields of all parent categories, or select specific fields to make the response size smaller. For example, `fields=parent_category.id,parent_category.name`.",
///             "title": "include_ancestors_tree"
///         },
///         "include_descendants_tree": {
///             "type": "boolean",
///             "description": "Whether to retrieve a list of child categories. If you enable this, add to the `fields` query parameter `category_children` to set the children of a category in this field. You can either pass `*category_children` to retreieve the fields of all child categories, or select specific fields to make the response size smaller. For example, `fields=category_children.id,category_children.name`.",
///             "title": "include_descendants_tree"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_product_categories_id_query_parameters.freezed.dart';
part 'get_product_categories_id_query_parameters.g.dart'; // GetProductCategoriesIdQueryParameters

@freezed
abstract class GetProductCategoriesIdQueryParameters
    with _$GetProductCategoriesIdQueryParameters {
  const GetProductCategoriesIdQueryParameters._();

  @jsonSerializable
  const factory GetProductCategoriesIdQueryParameters({
    /// fields
    @JsonKey(name: GetProductCategoriesIdQueryParameters.fieldsKey)
    required String fields,

    /// includeAncestorsTree
    @JsonKey(
      name: GetProductCategoriesIdQueryParameters.includeAncestorsTreeKey,
    )
    required bool includeAncestorsTree,

    /// includeDescendantsTree
    @JsonKey(
      name: GetProductCategoriesIdQueryParameters.includeDescendantsTreeKey,
    )
    required bool includeDescendantsTree,
  }) = _GetProductCategoriesIdQueryParameters;

  factory GetProductCategoriesIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetProductCategoriesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String includeAncestorsTreeKey = r'include_ancestors_tree';

  static const String includeDescendantsTreeKey = r'include_descendants_tree';
}
