import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCancelClaimRes {
  final Order? order;
  UserCancelClaimRes(this.order);

  factory UserCancelClaimRes.fromJson(Map<String, dynamic> json) {
    return UserCancelClaimRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}

class UserCreateClaimShipmentRes {
  final Order? order;
  UserCreateClaimShipmentRes(this.order);

  factory UserCreateClaimShipmentRes.fromJson(Map<String, dynamic> json) {
    return UserCreateClaimShipmentRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}

class UserCreateClaimRes {
  final Order? order;
  UserCreateClaimRes(this.order);

  factory UserCreateClaimRes.fromJson(Map<String, dynamic> json) {
    return UserCreateClaimRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}

class UserUpdateClaimRes {
  final Order? order;
  UserUpdateClaimRes(this.order);

  factory UserUpdateClaimRes.fromJson(Map<String, dynamic> json) {
    return UserUpdateClaimRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}
