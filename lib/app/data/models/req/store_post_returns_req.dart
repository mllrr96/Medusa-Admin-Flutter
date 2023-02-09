
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
        items!.add(new ReturnItem.fromJson(v));
      });
    }
    returnShipping = json['return_shipping'] != null
        ? new ReturnShipping.fromJson(json['return_shipping'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.returnShipping != null) {
      data['return_shipping'] = this.returnShipping!.toJson();
    }
    return data;
  }
}
