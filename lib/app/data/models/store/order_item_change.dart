import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';

import 'index.dart';
part 'order_item_change.g.dart';

@CopyWith()
class OrderItemChange {
  final String? id;
  final OrderEditItemChangeType? type;
  final String? orderEditId;
  final OrderEdit? orderEdit;
  final String? originalLineItemId;
  final LineItem? originalLineItem;
  final String? lineItemId;
  final LineItem? lineItem;

  OrderItemChange({
    this.id,
    this.type,
    this.orderEditId,
    this.orderEdit,
    this.originalLineItemId,
    this.originalLineItem,
    this.lineItemId,
    this.lineItem,
  });

  factory OrderItemChange.fromJson(Map<String, dynamic> json) {
    return OrderItemChange(
      id: json['id'],
      type: OrderEditItemChangeType.values.firstWhereOrNull((e) => e.value == (json['type'] ?? 'item_add')),
      orderEditId: json['order_edit_id'],
      orderEdit: json['order_edit'] != null ? OrderEdit.fromJson(json['order_edit']) : null,
      originalLineItemId: json['original_line_item_id'],
      originalLineItem: json['original_line_item'] != null ? LineItem.fromJson(json['original_line_item']) : null,
      lineItem: json['line_item'] != null ? LineItem.fromJson(json['line_item']) : null,
      lineItemId: json['line_item_id'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type?.value;
    json['order_edit_id'] = orderEditId;
    json['order_edit'] = orderEdit;
    json['original_line_item_id'] = originalLineItemId;
    json['original_line_item'] = originalLineItem?.toJson();
    json['line_item_id'] = lineItemId;
    json['line_item'] = lineItem?.toJson();
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
