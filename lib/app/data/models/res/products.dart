
import '../store/product.dart';
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
