import 'package:medusa_admin/app/data/models/store/index.dart';

import 'common.dart';

class UserCreateShippingOptionRes {
  UserCreateShippingOptionRes({required this.shippingOption});
  final ShippingOption shippingOption;

  factory UserCreateShippingOptionRes.fromJson(Map<String, dynamic> json) {
    return UserCreateShippingOptionRes(shippingOption: json['shipping_option']);
  }
}

class UserDeleteShippingOptionRes {
  /// The ID of the deleted Collection
  String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "shipping-option"
  String? object;

  /// Whether the collection was deleted successfully or not.
  ///
  /// Default: true
  bool? deleted;

  UserDeleteShippingOptionRes.fromJson(json) {
    id = json['id'];
    object = json['object'];
    deleted = json['deleted'];
  }
}

class UserUpdateShippingOptionRes {
  UserUpdateShippingOptionRes({required this.shippingOption});
  final ShippingOption shippingOption;
  factory UserUpdateShippingOptionRes.fromJson(Map<String, dynamic> json) =>
      UserUpdateShippingOptionRes(shippingOption: json['shipping_option']);
}

class UserRetrieveShippingOptionRes {
  UserRetrieveShippingOptionRes({required this.shippingOption});
  final ShippingOption shippingOption;
  factory UserRetrieveShippingOptionRes.fromJson(Map<String, dynamic> json) =>
      UserRetrieveShippingOptionRes(shippingOption: json['shipping_option']);
}

class UserRetrieveAllShippingOptionRes extends PaginatedResponse {
  List<ShippingOption>? shippingOptions;

  UserRetrieveAllShippingOptionRes.fromJson(json) : super.fromJson(json) {
    if (json['shipping_options'] != null) {
      shippingOptions = <ShippingOption>[];
      json['collections'].forEach((v) {
        shippingOptions?.add(ShippingOption.fromJson(v));
      });
    }
  }
}
