import 'package:medusa_admin/app/data/models/store/stock_location.dart';

class UserCreateStockLocationRes {
  final StockLocation? stockLocation;

  UserCreateStockLocationRes(this.stockLocation);

  factory UserCreateStockLocationRes.fromJson(Map<String, dynamic> json) {
    return UserCreateStockLocationRes(
        json['stock_location'] != null ? StockLocation.fromJson(json['stock_location']) : null);
  }
}

class UserRetrieveStockLocationRes {
  final StockLocation? stockLocation;

  UserRetrieveStockLocationRes(this.stockLocation);

  factory UserRetrieveStockLocationRes.fromJson(Map<String, dynamic> json) {
    return UserRetrieveStockLocationRes(
        json['stock_location'] != null ? StockLocation.fromJson(json['stock_location']) : null);
  }
}

class UserUpdateStockLocationRes {
  final StockLocation? stockLocation;

  UserUpdateStockLocationRes(this.stockLocation);

  factory UserUpdateStockLocationRes.fromJson(Map<String, dynamic> json) {
    return UserUpdateStockLocationRes(
        json['stock_location'] != null ? StockLocation.fromJson(json['stock_location']) : null);
  }
}

class UserDeleteStockLocationRes {
  /// The ID of the deleted Order Edit Item Change.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "discount"
  final String? object;

  /// Whether the discount was deleted successfully or not.
  final bool deleted;

  UserDeleteStockLocationRes({required this.deleted, this.id, this.object});

  factory UserDeleteStockLocationRes.fromJson(json) {
    return UserDeleteStockLocationRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
