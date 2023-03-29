import 'package:medusa_admin/app/data/models/res/common.dart';

import '../store/order.dart';
import '../store/swap.dart';

class UserCancelSwapRes {
  final Order? order;
  UserCancelSwapRes(this.order);

  factory UserCancelSwapRes.fromJson(Map<String, dynamic> json) {
    return UserCancelSwapRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}

class UserCreateSwapShipmentSwapRes {
  final Order? order;
  UserCreateSwapShipmentSwapRes(this.order);

  factory UserCreateSwapShipmentSwapRes.fromJson(Map<String, dynamic> json) {
    return UserCreateSwapShipmentSwapRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}

class UserCreateSwapSwapRes {
  final Order? order;
  UserCreateSwapSwapRes(this.order);

  factory UserCreateSwapSwapRes.fromJson(Map<String, dynamic> json) {
    return UserCreateSwapSwapRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}

class UserProcessSwapPaymentRes {
  final Order? order;
  UserProcessSwapPaymentRes(this.order);

  factory UserProcessSwapPaymentRes.fromJson(Map<String, dynamic> json) {
    return UserProcessSwapPaymentRes(json['order'] != null ? Order.fromJson(json['order']) : null);
  }
}

class UserRetrieveSwapRes {
  final Swap? swap;
  UserRetrieveSwapRes(this.swap);

  factory UserRetrieveSwapRes.fromJson(Map<String, dynamic> json) {
    return UserRetrieveSwapRes(json['swap'] != null ? Swap.fromJson(json['swap']) : null);
  }
}

class UserRetrieveSwapsRes extends PaginatedResponse {
  List<Swap>? swaps;

  UserRetrieveSwapsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['swaps'] == null) return;
    swaps = <Swap>[];
    json['swaps'].forEach((v) => swaps!.add(Swap.fromJson(v)));
  }
}
