class UserCreateProductCategoryReq {
  /// The name to identify the Product Category by.
  final String name;

  /// An optional handle to be used in slugs, if none is provided we will kebab-case the title.
  final String? handle;

  /// The ID of the parent product category
  final String? parentCategoryId;

  /// A flag to make product category an internal category for admins
  final bool? isInternal;

  /// A flag to make product category visible/hidden in the store front
  final bool? isActive;

  UserCreateProductCategoryReq({
    required this.name,
    this.isInternal,
    this.isActive,
    this.handle,
    this.parentCategoryId,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['name'] = name;

    if (handle != null) {
      json['handle'] = handle;
    }

    if (parentCategoryId != null) {
      json['parent_category_id'] = parentCategoryId;
    }

    if (isActive != null) {
      json['is_active'] = isActive;
    }

    if (isInternal != null) {
      json['is_internal'] = isInternal;
    }

    return json;
  }
}
class UserUpdateProductCategoryReq {
  /// The name to identify the Product Category by.
  final String? name;

  /// An optional handle to be used in slugs, if none is provided we will kebab-case the title.
  final String? handle;

  /// The ID of the parent product category
  final String? parentCategoryId;

  /// A flag to make product category an internal category for admins
  final bool? isInternal;

  /// A flag to make product category visible/hidden in the store front
  final bool? isActive;

  UserUpdateProductCategoryReq({
    this.name,
    this.isInternal,
    this.isActive,
    this.handle,
    this.parentCategoryId,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (name != null) {
      json['name'] = name;
    }
    if (handle != null) {
      json['handle'] = handle;
    }

    if (parentCategoryId != null) {
      json['parent_category_id'] = parentCategoryId;
    }

    if (isActive != null) {
      json['is_active'] = isActive;
    }

    if (isInternal != null) {
      json['is_internal'] = isInternal;
    }

    return json;
  }
}
