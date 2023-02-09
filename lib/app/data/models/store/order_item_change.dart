import 'index.dart';


class OrderItemChange {
  String? id;
  OrderEditItemChangeType? type;
  String? orderEditId;
  OrderEdit? orderEdit;
  String? originalLineItemId;
  LineItem? originalLineItem;
  String? lineItemId;
  LineItem? lineItem;

  OrderItemChange(
    this.id,
    this.type,
    this.orderEditId,
    this.orderEdit,
    this.originalLineItemId,
    this.originalLineItem,
    this.lineItemId,
    this.lineItem,
  );

  OrderItemChange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = OrderEditItemChangeType.values
        .firstWhere((e) => e.value == (json['type'] ?? ''));
    orderEditId = json['order_edit_id'];
    orderEdit = json['order_edit'];
    originalLineItemId = json['original_line_item_id'];
    originalLineItem = json['original_line_item'] != null
        ? LineItem.fromJson(json['original_line_item'])
        : null;
    lineItemId = json['line_item_id'];
    lineItem =
        json['line_item'] != null ? LineItem.fromJson(json['line_item']) : null;
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type?.value;
    json['order_edit_id'] = orderEditId;
    json['order_edit'] = orderEdit;
    json['original_line_item_id'] = originalLineItemId;
    json['original_line_item'] = originalLineItem?.toJson() ?? {};
    json['line_item_id'] = lineItemId;
    json['line_item'] = lineItem?.toJson() ?? {};
    return json;
  }
}

enum OrderEditItemChangeType {
  itemAdd('item_add'),
  itemRemove('item_remove'),
  itemUpdate('item_update');

  final String value;

  const OrderEditItemChangeType(this.value);
}
