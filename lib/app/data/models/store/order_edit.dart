import 'index.dart';
import 'payment_collection.dart';

class OrderEdit {
  /// The order edit's id
  String? id;

  /// The id of the order that is edited
  String? orderId;

  /// The details of the order that this order edit was created for.
  Order? order;

  /// The details of all the changes on the original order's line items.
  List<OrderItemChange>? changes;

  /// The status of the order edit.
  OrderEditStatus status = OrderEditStatus.created;
  /// An optional note with additional details about the order edit.
  String? internalNote;

  /// The unique identifier of the user or customer who created the order edit.
  String? createdBy;

  /// The unique identifier of the user or customer who requested the order edit.
  String? requestedBy;

  /// The unique identifier of the user or customer who declined the order edit.
  String? declinedBy;

  /// The unique identifier of the user or customer who confirmed the order edit.
  String? confirmedBy;

  /// The date with timezone at which the edit was requested.
  DateTime? requestedAt;

  /// The date with timezone at which the edit was confirmed.
  DateTime? confirmedAt;

  /// The date with timezone at which the edit was declined.
  DateTime? declinedAt;

  /// An optional note why the order edit is declined.
  String? declinedReason;

  /// The unique identifier of the user or customer who cancelled the order edit.
  String? canceledBy;

  /// The date with timezone at which the edit was cancelled.
  DateTime? canceledAt;

  /// The id of the payment collection
  String? paymentCollectionId;

  /// The details of the payment collection used to authorize additional payment if necessary.
  PaymentCollection? paymentCollection;

  int? subtotal;
  int? discountTotal;
  int? taxTotal;
  int? total;

  /// The difference between the total amount of the order and total amount of edited order.
  int? differenceDue;

  /// The details of the cloned items from the original order with the new changes. once the order edit is confirmed, these line items are associated with the original order.
  List<LineItem>? items;

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
    this.status = OrderEditStatus.created,
    this.paymentCollection,
    this.paymentCollectionId,
    this.canceledAt,
    this.canceledBy,
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
    status = OrderEditStatus.values
        .firstWhere((e) => e.name == (json['status'] ?? ''), orElse: () => OrderEditStatus.created);
    if (json['items'] != null) {
      items = <LineItem>[];
      json['items'].forEach((e) => items!.add(LineItem.fromJson(e)));
    }
    paymentCollection =
        json['payment_collection'] != null ? PaymentCollection.fromJson(json['payment_collection']) : null;
    paymentCollectionId = json['payment_collection_id'];
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal();
    canceledBy = json['canceled_by'];
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
    json['status'] = status.name;
    json['canceled_by'] = canceledBy;
    json['canceled_at'] = canceledAt.toString();
    json['payment_collection_id'] = paymentCollectionId;
    return json;
  }
}

enum OrderEditStatus {
  confirmed,
  declined,
  requested,
  created,
  canceled,
}
