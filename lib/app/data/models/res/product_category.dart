import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/product_category.dart';
import 'package:medusa_admin/app/data/models/store/reservation.dart';

class UserAddProductsToCategoryRes {
  final ProductCategory? productCategory;
  UserAddProductsToCategoryRes(this.productCategory);

  factory UserAddProductsToCategoryRes.fromJson(Map<String, dynamic> json) {
    return UserAddProductsToCategoryRes(
        json['product_category'] != null ? ProductCategory.fromJson(json['product_category']) : null);
  }
}

class UserRetrieveProductCategoryRes {
  final ProductCategory? productCategory;
  UserRetrieveProductCategoryRes(this.productCategory);

  factory UserRetrieveProductCategoryRes.fromJson(Map<String, dynamic> json) {
    return UserRetrieveProductCategoryRes(
        json['product_category'] != null ? ProductCategory.fromJson(json['product_category']) : null);
  }
}

class UserUpdateProductCategoryRes {
  final ProductCategory? productCategory;
  UserUpdateProductCategoryRes(this.productCategory);

  factory UserUpdateProductCategoryRes.fromJson(Map<String, dynamic> json) {
    return UserUpdateProductCategoryRes(
        json['product_category'] != null ? ProductCategory.fromJson(json['product_category']) : null);
  }
}

class UserDeleteProductsToCategoryRes {
  final ProductCategory? productCategory;
  UserDeleteProductsToCategoryRes(this.productCategory);

  factory UserDeleteProductsToCategoryRes.fromJson(Map<String, dynamic> json) {
    return UserDeleteProductsToCategoryRes(
        json['product_category'] != null ? ProductCategory.fromJson(json['product_category']) : null);
  }
}

class UserDeleteProductCategoryRes {
  /// The ID of the deleted Order Edit Item Change.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "discount"
  final String? object;

  /// Whether the discount was deleted successfully or not.
  final bool deleted;

  UserDeleteProductCategoryRes({required this.deleted, this.id, this.object});

  factory UserDeleteProductCategoryRes.fromJson(json) {
    return UserDeleteProductCategoryRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}

class UserCreateProductCategoryRes {
  final ProductCategory? productCategory;
  UserCreateProductCategoryRes(this.productCategory);

  factory UserCreateProductCategoryRes.fromJson(Map<String, dynamic> json) {
    return UserCreateProductCategoryRes(
        json['product_category'] != null ? ProductCategory.fromJson(json['product_category']) : null);
  }
}

class UserRetrieveProductCategoriesRes extends PaginatedResponse {
  List<ProductCategory>? productCategories;

  UserRetrieveProductCategoriesRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['product_categories'] != null) {
      productCategories = <ProductCategory>[];
      json['product_categories'].forEach((v) {
        productCategories?.add(ProductCategory.fromJson(v));
      });
    }
  }
}

class UserRetrieveReservationsRes extends PaginatedResponse {
  List<Reservation>? reservations;

  UserRetrieveReservationsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['reservations'] != null) {
      reservations = <Reservation>[];
      json['reservations'].forEach((v) {
        reservations?.add(Reservation.fromJson(v));
      });
    }
  }
}
