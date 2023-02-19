import '../store/order.dart';
import 'common.dart';

class UserOrderRes {
  Order? order;

  UserOrderRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order?.toJson();
    return data;
  }
}

class UserOrdersRes extends PaginatedResponse {
  List<Order>? orders;

  UserOrdersRes.fromJson(json) : super.fromJson(json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders?.add(Order.fromJson(v));
      });
    }
  }
}
