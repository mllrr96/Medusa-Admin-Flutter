/// StoreProductCategory
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The category's ID.",
///             "title": "id"
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
///         "handle": {
///             "type": "string",
///             "description": "The category's handle.",
///             "title": "handle"
///         },
///         "rank": {
///             "type": "number",
///             "description": "The category's rank.",
///             "title": "rank"
///         },
///         "parent_category_id": {
///             "type": "string",
///             "description": "The ID of the category's parent.",
///             "title": "parent_category_id"
///         },
///         "parent_category": {
///             "type": "object"
///         },
///         "category_children": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The category's children."
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
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the category was deleted.",
///             "title": "deleted_at"
///         },
///         "products": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProduct"
///             },
///             "description": "The category's products."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "description",
///         "handle",
///         "rank",
///         "parent_category_id",
///         "parent_category",
///         "category_children",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The category's details."
/// }
library store_product_category;

import 'exports.dart';
part 'store_product_category.freezed.dart';
part 'store_product_category.g.dart'; // StoreProductCategory

@freezed
abstract class StoreProductCategory with _$StoreProductCategory {
  const StoreProductCategory._();

  @jsonSerializable
  const factory StoreProductCategory({
    /// id
    @JsonKey(name: StoreProductCategory.idKey) required String id,

    /// name
    @JsonKey(name: StoreProductCategory.nameKey) required String name,

    /// description
    @JsonKey(name: StoreProductCategory.descriptionKey)
    required String description,

    /// handle
    @JsonKey(name: StoreProductCategory.handleKey) required String handle,

    /// rank
    @JsonKey(name: StoreProductCategory.rankKey) required double rank,

    /// parentCategoryId
    @JsonKey(name: StoreProductCategory.parentCategoryIdKey)
    required String parentCategoryId,

    /// parentCategory
    @JsonKey(name: StoreProductCategory.parentCategoryKey)
    required Map<String, dynamic> parentCategory,

    /// categoryChildren
    @JsonKey(name: StoreProductCategory.categoryChildrenKey)
    required List<Map<String, dynamic>> categoryChildren,

    /// metadata
    @JsonKey(name: StoreProductCategory.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreProductCategory.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProductCategory.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreProductCategory.deletedAtKey)
    required DateTime deletedAt,

    /// products
    @JsonKey(name: StoreProductCategory.productsKey)
    required List<StoreProduct> products,
  }) = _StoreProductCategory;

  factory StoreProductCategory.fromJson(Map<String, dynamic> json) =>
      _$StoreProductCategoryFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String handleKey = r'handle';

  static const String rankKey = r'rank';

  static const String parentCategoryIdKey = r'parent_category_id';

  static const String parentCategoryKey = r'parent_category';

  static const String categoryChildrenKey = r'category_children';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String productsKey = r'products';
}
