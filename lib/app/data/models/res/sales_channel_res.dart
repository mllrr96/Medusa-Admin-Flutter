import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/stock_location.dart';

import '../store/sales_channel.dart';

class UserSalesChannelRetrieveAllRes extends PaginatedResponse {
  List<SalesChannel>? salesChannels;

  UserSalesChannelRetrieveAllRes.fromJson(json) : super.fromJson(json) {
    if (json['sales_channels'] == null) return;
    salesChannels = <SalesChannel>[];
    json['sales_channels'].forEach((v) => salesChannels!.add(SalesChannel.fromJson(v)));
  }
}

class UserRetrieveStockLocationsRes extends PaginatedResponse {
  List<StockLocation>? stockLocations;

  UserRetrieveStockLocationsRes.fromJson(json) : super.fromJson(json) {
    if (json['stock_locations'] == null) return;
    stockLocations = <StockLocation>[];
    json['stock_locations'].forEach((v) => stockLocations!.add(StockLocation.fromJson(v)));
  }
}

class UserSalesChannelRetrieveRes {
  SalesChannel? salesChannel;
  UserSalesChannelRetrieveRes.fromJson(Map<String, dynamic> json) {
    if (json['sales_channel'] != null) {
      salesChannel = SalesChannel.fromJson(json['sales_channel']);
    }
  }
}

class UserAddProductsToSalesChannelRes {
  SalesChannel? salesChannel;
  UserAddProductsToSalesChannelRes.fromJson(Map<String, dynamic> json) {
    if (json['sales_channel'] == null) return;
    salesChannel = SalesChannel.fromJson(json['sales_channel']);
  }
}

class UserRemoveProductsToSalesChannelRes {
  SalesChannel? salesChannel;
  UserRemoveProductsToSalesChannelRes.fromJson(Map<String, dynamic> json) {
    if (json['sales_channel'] == null) return;
    salesChannel = SalesChannel.fromJson(json['sales_channel']);
  }
}

class UserAssociateStockLocationToSalesChannelRes {
  SalesChannel? salesChannel;
  UserAssociateStockLocationToSalesChannelRes.fromJson(Map<String, dynamic> json) {
    if (json['sales_channel'] == null) return;
    salesChannel = SalesChannel.fromJson(json['sales_channel']);
  }
}

class UserRemoveStockLocationToSalesChannelRes {
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

  UserRemoveStockLocationToSalesChannelRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deleted = json['deleted'] ?? false;
    object = json['object'];
  }
}

class UserSalesChannelUpdateRes {
  SalesChannel? salesChannel;
  UserSalesChannelUpdateRes.fromJson(Map<String, dynamic> json) {
    if (json['sales_channel'] != null) {
      salesChannel = SalesChannel.fromJson(json['sales_channel']);
    }
  }
}

class UserCreateSalesChannelRes {
  SalesChannel? salesChannel;
  UserCreateSalesChannelRes.fromJson(Map<String, dynamic> json) {
    if (json['sales_channel'] == null) return;
    salesChannel = SalesChannel.fromJson(json['sales_channel']);
  }
}

class UserSalesChannelDeleteRes {
  /// The ID of the deleted user.
  String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "sales-channel"
  String? object;

  /// Whether or not the items were deleted.
  ///
  /// Default: true
  bool? deleted;

  UserSalesChannelDeleteRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    deleted = json['deleted'];
  }
}
