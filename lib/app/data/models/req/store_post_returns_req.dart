
import '../common/return_item.dart';
import '../common/return_shipping.dart';


class StorePostReturnsReq {
  String? orderId;
  List<ReturnItem>? items;
  ReturnShipping? returnShipping;

  StorePostReturnsReq({this.orderId, this.items, this.returnShipping});

  StorePostReturnsReq.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    if (json['items'] != null) {
      items = <ReturnItem>[];
      json['items'].forEach((v) {
        items!.add(ReturnItem.fromJson(v));
      });
    }
    returnShipping = json['return_shipping'] != null
        ? ReturnShipping.fromJson(json['return_shipping'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (returnShipping != null) {
      data['return_shipping'] = returnShipping!.toJson();
    }
    return data;
  }
}
