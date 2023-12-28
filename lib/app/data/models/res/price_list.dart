import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserPriceListRes {
  final PriceList? priceList;

  UserPriceListRes(this.priceList);

  factory UserPriceListRes.fromJson(Map<String, dynamic> json) {
    return UserPriceListRes(json['price_list'] != null
        ? PriceList.fromJson(json['price_list'])
        : null);
  }
}

class UserDeletePricesRes {
  final List<String>? ids;

  /// The type of the object that was deleted.
  ///
  /// Default: "money-amount"
  final String? object;

  /// Whether or not the items were deleted.
  final bool deleted;
  UserDeletePricesRes({required this.deleted, this.ids, this.object});
  factory UserDeletePricesRes.fromJson(json) {
    return UserDeletePricesRes(
        deleted: json['deleted'] ?? false,
        ids: json['ids'],
        object: json['object']);
  }
}

class UserDeleteProductPricesRes {
  /// The price ids that have been deleted.
  final List<String>? ids;

  /// The type of the object that was deleted.
  ///
  /// Default: "money-amount"
  final String? object;

  /// Whether or not the items were deleted.
  final bool deleted;
  UserDeleteProductPricesRes({required this.deleted, this.ids, this.object});
  factory UserDeleteProductPricesRes.fromJson(json) {
    return UserDeleteProductPricesRes(
        deleted: json['deleted'] ?? false,
        ids: List<String>.from(json['ids']),
        object: json['object']);
  }
}

class UserDeleteVariantPricesRes {
  /// The price ids that have been deleted.
  final List<String>? ids;

  /// The type of the object that was deleted.
  ///
  /// Default: "money-amount"
  final String? object;

  /// Whether or not the items were deleted.
  final bool deleted;
  UserDeleteVariantPricesRes({required this.deleted, this.ids, this.object});
  factory UserDeleteVariantPricesRes.fromJson(json) {
    return UserDeleteVariantPricesRes(
        deleted: json['deleted'] ?? false,
        ids: json['ids'],
        object: json['object']);
  }
}

class UserDeletePriceListRes {
  /// The ID of the deleted Price List.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "price-list"
  final String? object;

  /// Whether or not the items were deleted.
  final bool deleted;
  UserDeletePriceListRes({required this.deleted, this.id, this.object});
  factory UserDeletePriceListRes.fromJson(json) {
    return UserDeletePriceListRes(
        deleted: json['deleted'] ?? false,
        id: json['id'],
        object: json['object']);
  }
}

class UserPriceListsRes extends PaginatedResponse {
  List<PriceList>? priceLists;

  UserPriceListsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['price_lists'] == null) return;
    priceLists = <PriceList>[];
    json['price_lists'].forEach((v) => priceLists!.add(PriceList.fromJson(v)));
  }
}

class UserPriceListsProductsRes extends PaginatedResponse {
  List<Product>? products;

  UserPriceListsProductsRes.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json['products'] == null) return;
    products = <Product>[];
    json['products'].forEach((v) => products!.add(Product.fromJson(v)));
  }
}
