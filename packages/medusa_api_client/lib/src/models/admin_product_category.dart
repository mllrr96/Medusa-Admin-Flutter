/// AdminProductCategory
/// {
///     "properties": {
///         "category_children": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The category's children."
///         },
///         "parent_category": {
///             "type": "object"
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
///         "category_children",
///         "parent_category",
///         "name",
///         "description",
///         "id",
///         "created_at",
///         "updated_at",
///         "handle",
///         "deleted_at",
///         "is_active",
///         "is_internal",
///         "rank",
///         "parent_category_id"
///     ],
///     "description": "The product category's details."
/// }
library admin_product_category;

import 'exports.dart';
part 'admin_product_category.freezed.dart';
part 'admin_product_category.g.dart'; // AdminProductCategory

@freezed
abstract class AdminProductCategory with _$AdminProductCategory {
  const AdminProductCategory._();

  @jsonSerializable
  const factory AdminProductCategory({
    /// categoryChildren
    @JsonKey(name: AdminProductCategory.categoryChildrenKey)
    required List<Map<String, dynamic>> categoryChildren,

    /// parentCategory
    @JsonKey(name: AdminProductCategory.parentCategoryKey)
    required Map<String, dynamic> parentCategory,

    /// products
    @JsonKey(name: AdminProductCategory.productsKey)
    required List<Map<String, dynamic>> products,

    /// name
    @JsonKey(name: AdminProductCategory.nameKey) required String name,

    /// description
    @JsonKey(name: AdminProductCategory.descriptionKey)
    required String description,

    /// id
    @JsonKey(name: AdminProductCategory.idKey) required String id,

    /// metadata
    @JsonKey(name: AdminProductCategory.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminProductCategory.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminProductCategory.updatedAtKey)
    required DateTime updatedAt,

    /// handle
    @JsonKey(name: AdminProductCategory.handleKey) required String handle,

    /// deletedAt
    @JsonKey(name: AdminProductCategory.deletedAtKey)
    required DateTime deletedAt,

    /// isActive
    @JsonKey(name: AdminProductCategory.isActiveKey) required bool isActive,

    /// isInternal
    @JsonKey(name: AdminProductCategory.isInternalKey) required bool isInternal,

    /// rank
    @JsonKey(name: AdminProductCategory.rankKey) required double rank,

    /// parentCategoryId
    @JsonKey(name: AdminProductCategory.parentCategoryIdKey)
    required String parentCategoryId,
  }) = _AdminProductCategory;

  factory AdminProductCategory.fromJson(Map<String, dynamic> json) =>
      _$AdminProductCategoryFromJson(json);

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
