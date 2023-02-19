import '../store/product.dart';
import '../store/product_variant.dart';
import 'common.dart';

class UserProductsListRes extends PaginatedResponse {
  List<Product>? products;

  UserProductsListRes.fromJson(json) : super.fromJson(json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['products'] = products?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}

class UserProductsRes {
  Product? product;

  UserProductsRes.fromJson(json) {
    product = json["product"] != null ? Product.fromJson(json["product"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product?.toJson();
    return data;
  }
}

class UserPostSearchRes {
  List<dynamic>? hits;

  UserPostSearchRes.fromJson(json) {
    if (json['hits'] != null) {
      hits = json['hits'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hits'] = hits;
    return data;
  }
}

class UserVariantsRes {
  List<ProductVariant>? variants;

  UserVariantsRes.fromJson(json) {
    if (json['variants'] != null) {
      variants = <ProductVariant>[];
      json['variants'].forEach((v) {
        variants?.add(ProductVariant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variants'] = variants?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}

class UserDeleteProductRes {
  /// The ID of the deleted Product.
  String? id;

  /// Whether or not the items were deleted.
  ///
  /// Default: true
  bool? deleted;

  /// The type of the object that was deleted.
  ///
  /// Default: "product"
  String? object;

  UserDeleteProductRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deleted = json['deleted'];
    object = json['object'];
  }
}
