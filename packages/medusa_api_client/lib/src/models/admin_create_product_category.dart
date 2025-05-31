/// AdminCreateProductCategory
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The product category's name.",
///             "title": "name"
///         },
///         "description": {
///             "type": "string",
///             "description": "The product category's description.",
///             "title": "description"
///         },
///         "handle": {
///             "type": "string",
///             "description": "The product category's handle.",
///             "title": "handle"
///         },
///         "is_internal": {
///             "type": "boolean",
///             "description": "Whether the product category is only used and seen by admin users.",
///             "title": "is_internal"
///         },
///         "is_active": {
///             "type": "boolean",
///             "description": "Whether the product category is active.",
///             "title": "is_active"
///         },
///         "parent_category_id": {
///             "type": "string",
///             "description": "The ID of a category that's the parent of this one.",
///             "title": "parent_category_id"
///         },
///         "rank": {
///             "type": "number",
///             "description": "The sorting order of the product category among sibling categories.",
///             "title": "rank"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The product category's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name"
///     ],
///     "description": "The product category's details."
/// }
library;

import 'exports.dart';
part 'admin_create_product_category.freezed.dart';
part 'admin_create_product_category.g.dart'; // AdminCreateProductCategory

@freezed
abstract class AdminCreateProductCategory with _$AdminCreateProductCategory {
  const AdminCreateProductCategory._();

  @jsonSerializable
  const factory AdminCreateProductCategory({
    /// name
    @JsonKey(name: AdminCreateProductCategory.nameKey) required String name,

    /// description
    @JsonKey(name: AdminCreateProductCategory.descriptionKey)
    required String description,

    /// handle
    @JsonKey(name: AdminCreateProductCategory.handleKey) required String handle,

    /// isInternal
    @JsonKey(name: AdminCreateProductCategory.isInternalKey)
    required bool isInternal,

    /// isActive
    @JsonKey(name: AdminCreateProductCategory.isActiveKey)
    required bool isActive,

    /// parentCategoryId
    @JsonKey(name: AdminCreateProductCategory.parentCategoryIdKey)
    required String parentCategoryId,

    /// rank
    @JsonKey(name: AdminCreateProductCategory.rankKey) required double rank,

    /// metadata
    @JsonKey(name: AdminCreateProductCategory.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateProductCategory;

  factory AdminCreateProductCategory.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateProductCategoryFromJson(json);

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String handleKey = r'handle';

  static const String isInternalKey = r'is_internal';

  static const String isActiveKey = r'is_active';

  static const String parentCategoryIdKey = r'parent_category_id';

  static const String rankKey = r'rank';

  static const String metadataKey = r'metadata';
}
