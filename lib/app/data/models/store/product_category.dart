import 'package:flutter/foundation.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';

class ProductCategory {
  // TODO: find out what is category children
  // final dynamic categoryChildren;

  /// The product category's ID
  final String? id;

  /// The product category's name
  ///
  /// Example: "Regular Fit"
  final String? name;

  /// A unique string that identifies the Product Category - can for example be used in slug structures.
  final String? handle;

  /// A string for Materialized Paths - used for finding ancestors and descendants
  ///
  /// Example: "pcat_id1.pcat_id2.pcat_id3"
  final String? mPath;

  /// The ID of the parent category.
  final String? parentCategoryId;

  /// A product category object.
  final Category? parentCategory;

  /// Products associated with category.
  final List<Product>? products;

  /// A flag to make product category an internal category for admins
  ///
  /// Default: false
  final bool? isInternal;

  /// A flag to make product category visible/hidden in the store front
  ///
  /// Default: false
  final bool? isActive;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;
  ProductCategory({
    this.id,
    this.name,
    this.products,
    this.deletedAt,
    this.updatedAt,
    this.createdAt,
    this.handle,
    this.isActive,
    this.isInternal,
    this.mPath,
    this.parentCategory,
    this.parentCategoryId,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
      products: json['name']?.map((v) => Product.fromJson(v)).toList(),
      mPath: json['mpath'],
      isActive: json['is_active'],
      isInternal: json['is_internal'],
      parentCategory: json['parent_category'],
      parentCategoryId: json['parent_category_id'],
      handle: json['handle'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
    );
  }
}
