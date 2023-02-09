

import '../common/item.dart';
import '../common/return_item.dart';

class StorePostSwapsReq {
  String? orderId;
  List<ReturnItem>? returnItems;
  List<Item>? additionalItems;
  String? returnShippingOption;

  StorePostSwapsReq(
      {this.orderId,
      this.returnItems,
      this.additionalItems,
      this.returnShippingOption});

  StorePostSwapsReq.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    if (json['return_items'] != null) {
      returnItems = <ReturnItem>[];
      json['return_items'].forEach((v) {
        returnItems!.add(new ReturnItem.fromJson(v));
      });
    }
    if (json['additional_items'] != null) {
      additionalItems = <Item>[];
      json['additional_items'].forEach((v) {
        additionalItems!.add(new Item.fromJson(v));
      });
    }
    returnShippingOption = json['return_shipping_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    if (this.returnItems != null) {
      data['return_items'] = this.returnItems!.map((v) => v.toJson()).toList();
    }
    if (this.additionalItems != null) {
      data['additional_items'] =
          this.additionalItems!.map((v) => v.toJson()).toList();
    }
    data['return_shipping_option'] = this.returnShippingOption;
    return data;
  }
}
