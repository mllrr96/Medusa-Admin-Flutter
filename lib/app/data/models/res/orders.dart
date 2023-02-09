import '../store/order.dart';

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

class UserOrdersRes {
  List<Order>? orders;
  int? count, limit, offset;

  UserOrdersRes.fromJson(json) {
    List<dynamic> ordersAsMap = json['orders'];

    List<Map<String, dynamic>> ordersAsListMap = [];

    for (var element in ordersAsMap) {
      ordersAsListMap.add(Map<String, dynamic>.from(element));
    }

    List<Order> orders = [];
    for (var order in ordersAsListMap) {
      orders.add(Order.fromJson(order));
    }
    this.orders = orders;
    count = json['count'];
    limit = json['limit'];
    offset = json['offset'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['order'] = order?.toJson();
  //   return data;
  // }
}
