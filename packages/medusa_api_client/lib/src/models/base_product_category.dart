/// BaseProductCategory
/// {
///     "properties": {
///         "category_children": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductCategory"
///             },
///             "description": "The category's children."
///         },
///         "parent_category": {
///             "$ref": "#/components/schemas/AdminProductCategory"
///         },
///         "products": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The category's products."
///         },
///         "name": {
///             "type": "string",
///             "description": "The category's name.",
///             "title": "name"
///         },
///         "description": {
///             "type": "string",
///             "description": "The category's description.",
///             "title": "description"
///         },
///         "id": {
///             "type": "string",
///             "description": "The category's ID.",
///             "title": "id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The category's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the category was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the category was updated.",
///             "title": "updated_at"
///         },
///         "handle": {
///             "type": "string",
///             "description": "The category's unique handle.",
///             "title": "handle"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the category was deleted.",
///             "title": "deleted_at"
///         },
///         "is_active": {
///             "type": "boolean",
///             "description": "Whether the category is active. If disabled, the category isn't shown in the storefront.",
///             "title": "is_active"
///         },
///         "is_internal": {
///             "type": "boolean",
///             "description": "Whether the category is internal. If enabled, the category is only seen by admin users.",
///             "title": "is_internal"
///         },
///         "rank": {
///             "type": "number",
///             "description": "The category's rank among sibling categories.",
///             "title": "rank"
///         },
///         "parent_category_id": {
///             "type": "string",
///             "description": "The ID of the category's parent.",
///             "title": "parent_category_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "description",
///         "handle",
///         "is_active",
///         "is_internal",
///         "rank",
///         "parent_category_id",
///         "parent_category",
///         "category_children",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The product category's details."
/// }
library;

import 'exports.dart';
part 'base_product_category.freezed.dart';
part 'base_product_category.g.dart'; // BaseProductCategory

@freezed
abstract class BaseProductCategory with _$BaseProductCategory {
  const BaseProductCategory._();

  @jsonSerializable
  const factory BaseProductCategory({
    /// categoryChildren
    @JsonKey(name: BaseProductCategory.categoryChildrenKey)
    required List<AdminProductCategory> categoryChildren,

    /// parentCategory
    @JsonKey(name: BaseProductCategory.parentCategoryKey)
    required AdminProductCategory parentCategory,

    /// products
    @JsonKey(name: BaseProductCategory.productsKey)
    required List<Map<String, dynamic>> products,

    /// name
    @JsonKey(name: BaseProductCategory.nameKey) required String name,

    /// description
    @JsonKey(name: BaseProductCategory.descriptionKey)
    required String description,

    /// id
    @JsonKey(name: BaseProductCategory.idKey) required String id,

    /// metadata
    @JsonKey(name: BaseProductCategory.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseProductCategory.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProductCategory.updatedAtKey)
    required DateTime updatedAt,

    /// handle
    @JsonKey(name: BaseProductCategory.handleKey) required String handle,

    /// deletedAt
    @JsonKey(name: BaseProductCategory.deletedAtKey)
    required DateTime deletedAt,

    /// isActive
    @JsonKey(name: BaseProductCategory.isActiveKey) required bool isActive,

    /// isInternal
    @JsonKey(name: BaseProductCategory.isInternalKey) required bool isInternal,

    /// rank
    @JsonKey(name: BaseProductCategory.rankKey) required double rank,

    /// parentCategoryId
    @JsonKey(name: BaseProductCategory.parentCategoryIdKey)
    required String parentCategoryId,
  }) = _BaseProductCategory;

  factory BaseProductCategory.fromJson(Map<String, dynamic> json) =>
      _$BaseProductCategoryFromJson(json);

  static const String categoryChildrenKey = r'category_children';

  static const String parentCategoryKey = r'parent_category';

  static const String productsKey = r'products';

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String idKey = r'id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String handleKey = r'handle';

  static const String deletedAtKey = r'deleted_at';

  static const String isActiveKey = r'is_active';

  static const String isInternalKey = r'is_internal';

  static const String rankKey = r'rank';

  static const String parentCategoryIdKey = r'parent_category_id';
}
