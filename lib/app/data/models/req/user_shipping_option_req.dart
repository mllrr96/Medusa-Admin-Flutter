import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCreateShippingOptionReq {
  UserCreateShippingOptionReq({required this.shippingOption});
  final ShippingOption shippingOption;

  Map<String, dynamic> toJson() {
    return shippingOption.toJson();
  }
}

class UserUpdateShippingOptionReq {
  UserUpdateShippingOptionReq({required this.shippingOption});
  final ShippingOption shippingOption;

  Map<String, dynamic> toJson() {
    return shippingOption.toJson();
  }
}
