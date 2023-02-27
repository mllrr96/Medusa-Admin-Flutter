import 'package:medusa_admin/app/data/models/res/common.dart';

import '../store/sales_channel.dart';

class UserSalesChannelRetrieveAllRes extends PaginatedResponse {
  List<SalesChannel>? salesChannels;

  UserSalesChannelRetrieveAllRes.fromJson(json) : super.fromJson(json) {
    if (json['sales_channels'] != null) {
      salesChannels = [];
      for (var v in (json['sales_channels'] as List)) {
        salesChannels?.add(SalesChannel.fromJson(v));
      }
    }
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

class UserSalesChannelUpdateRes {
  SalesChannel? salesChannel;
  UserSalesChannelUpdateRes.fromJson(Map<String, dynamic> json) {
    if (json['sales_channel'] != null) {
      salesChannel = SalesChannel.fromJson(json['sales_channel']);
    }
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
