import 'index.dart';


class OrderEdit {
  String? id;
  String? orderId;
  Order? order;
  List<OrderItemChange>? changes;
  String? internalNote;
  String? createdBy;
  String? requestedBy;
  String? declinedBy;
  DateTime? confirmedBy;
  DateTime? requestedAt;
  DateTime? confirmedAt;
  DateTime? declinedAt;
  String? declinedReason;
  int? subtotal;
  int? discountTotal;
  int? taxTotal;
  int? total;
  int? differenceDue;
  List<LineItem>? items;
  List<LineItem>? removedItems;

  OrderEdit({
    this.id,
    required this.orderId,
    required this.order,
    required this.changes,
    this.internalNote,
    required this.createdBy,
    this.requestedBy,
    this.declinedBy,
    this.confirmedBy,
    this.requestedAt,
    this.confirmedAt,
    this.declinedAt,
    this.declinedReason,
    this.subtotal,
    this.discountTotal,
    this.taxTotal,
    this.total,
    this.differenceDue,
    this.items,
    this.removedItems,
  });

  OrderEdit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['changes'] != null) {
      changes = <OrderItemChange>[];
      json['changes'].forEach((e) => changes!.add(OrderItemChange.fromJson(e)));
    }
    internalNote = json['internal_note'];
    createdBy = json['created_by'];
    requestedBy = json['requested_by'];
    confirmedBy = json['confirmed_by'];
    declinedBy = json['declined_by'];
    requestedAt = DateTime.tryParse(json['requested_at'] ?? '')?.toLocal();
    confirmedAt = DateTime.tryParse(json['confirmed_at'] ?? '')?.toLocal();
    declinedAt = DateTime.tryParse(json['declined_at'] ?? '')?.toLocal();
    declinedReason = json['declined_reason'];
    subtotal = json['subtotal'];
    discountTotal = json['discount_total'];
    taxTotal = json['tax_total'];
    total = json['total'];
    differenceDue = json['difference_due'];
    if (json['items'] != null) {
      items = <LineItem>[];
      json['items'].forEach((e) => items!.add(LineItem.fromJson(e)));
    }
    if (json['removed_items'] != null) {
      removedItems = <LineItem>[];
      json['removed_items']
          .forEach((e) => removedItems!.add(LineItem.fromJson(e)));
    }
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['changes'] = changes?.map((e) => e.toJson()).toList();
    json['internal_note'] = internalNote;
    json['created_by'] = createdBy;
    json['confirmed_by'] = confirmedBy;
    json['declined_by'] = declinedBy;
    json['requested_at'] = requestedAt.toString();
    json['confirmed_at'] = confirmedAt.toString();
    json['declined_at'] = declinedAt.toString();
    json['declined_reason'] = declinedReason;
    json['subtotal'] = subtotal;
    json['discount_total'] = discountTotal;
    json['tax_total'] = taxTotal;
    json['total'] = total;
    json['difference_due'] = differenceDue;
    json['items'] = items?.map((e) => e.toJson()).toList() ?? [];
    json['removed_items'] = removedItems?.map((e) => e.toJson()).toList() ?? [];
    return json;
  }
}
