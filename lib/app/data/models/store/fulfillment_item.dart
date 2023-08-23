
import 'fulfillment.dart';
import 'line_item.dart';

class FulfillmentItem {
  String? fulfillmentId;
  String? itemId;
  Fulfillment? fulfillment;
  LineItem? item;
  int? quantity;

  FulfillmentItem({
    required this.fulfillmentId,
    required this.itemId,
    this.fulfillment,
    this.item,
    required this.quantity,
  });

  FulfillmentItem.fromJson(Map<String, dynamic> json) {
    fulfillmentId = json['fulfillment_id'];
    itemId = json['item_id'];
    fulfillment = json['fulfillment'] != null
        ? Fulfillment.fromJson(json['fulfillment'])
        : null;
    item = json['item'] != null ? LineItem.fromJson(json['item']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['fulfillment_id'] = fulfillmentId;
    json['item_id'] = itemId;
    json['fulfillment'] = fulfillment?.toJson();
    json['item'] = item?.toJson();
    json['quantity'] = quantity;
    return json;
  }
}
