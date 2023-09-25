import 'index.dart';
import 'payment_collection.dart';

class OrderEdit implements Comparable {
  /// The order edit's id
  final String? id;

  /// The id of the order that is edited
  final String? orderId;

  /// The details of the order that this order edit was created for.
  final Order? order;

  /// The details of all the changes on the original order's line items.
  final List<OrderItemChange>? changes;

  /// The status of the order edit.
  final OrderEditStatus status;

  /// An optional note with additional details about the order edit.
  final String? internalNote;

  /// The unique identifier of the user or customer who created the order edit.
  final String? createdBy;

  /// The unique identifier of the user or customer who requested the order edit.
  final String? requestedBy;

  /// The unique identifier of the user or customer who declined the order edit.
  final String? declinedBy;

  /// The unique identifier of the user or customer who confirmed the order edit.
  final String? confirmedBy;

  /// The date with timezone at which the edit was requested.
  final DateTime? requestedAt;

  /// The date with timezone at which the edit was confirmed.
  final DateTime? confirmedAt;

  /// The date with timezone at which the edit was declined.
  final DateTime? declinedAt;

  /// An optional note why the order edit is declined.
  final String? declinedReason;

  /// The unique identifier of the user or customer who cancelled the order edit.
  final String? canceledBy;

  /// The date with timezone at which the edit was cancelled.
  final DateTime? canceledAt;

  /// The id of the payment collection
  final String? paymentCollectionId;

  /// The details of the payment collection used to authorize additional payment if necessary.
  final PaymentCollection? paymentCollection;

  /// The total of subtotal
  final int? subtotal;

  /// The total of discount
  final int? discountTotal;

  /// The total of tax
  final int? taxTotal;

  /// The total amount of the edited order.
  final int? total;

  /// The difference between the total amount of the order and total amount of edited order.
  final int? differenceDue;

  /// The details of the cloned items from the original order with the new changes. once the order edit is confirmed, these line items are associated with the original order.
  final List<LineItem>? items;

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

  factory OrderEdit.fromJson(Map<String, dynamic> json) {
    List<LineItem>? items;
    List<OrderItemChange>? changes;
    if (json['changes'] != null) {
      changes = <OrderItemChange>[];
      json['changes'].forEach((e) => changes!.add(OrderItemChange.fromJson(e)));
    }
    if (json['items'] != null) {
      items = <LineItem>[];
      json['items'].forEach((e) => items!.add(LineItem.fromJson(e)));
    }
    return OrderEdit(
      id: json['id'],
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      changes: changes,
      items: items,
      createdBy: json['created_by'],
      requestedAt: DateTime.tryParse(json['requested_at'] ?? '')?.toLocal(),
      canceledAt: DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal(),
      declinedAt: DateTime.tryParse(json['declined_at'] ?? '')?.toLocal(),
      confirmedAt: DateTime.tryParse(json['confirmed_at'] ?? '')?.toLocal(),
      canceledBy: json['canceled_by'],
      requestedBy: json['requested_by'],
      declinedBy: json['declined_by'],
      confirmedBy: json['confirmed_by'],
      internalNote: json['internal_note'],
      declinedReason: json['declined_reason'],
      subtotal: json['subtotal'],
      discountTotal: json['discount_total'],
      taxTotal: json['tax_total'],
      differenceDue: json['difference_due'],
      total: json['total'],
      status: OrderEditStatus.values
          .firstWhere((e) => e.name == (json['status'] ?? ''), orElse: () => OrderEditStatus.created),
      paymentCollection:
          json['payment_collection'] != null ? PaymentCollection.fromJson(json['payment_collection']) : null,
      paymentCollectionId: json['payment_collection_id'],
    );
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

  @override
  int compareTo(other) {
    int compare(DateTime? a, DateTime? b) {
      if (a == null || b == null) {
        return 0;
      }

      if (a.isAfter(b)) {
        return -1;
      }

      if (a.isBefore(b)) {
        return 1;
      }
      return 0;
    }

    DateTime? b;
    if (other is OrderEdit) {
      b = other.confirmedAt ?? other.declinedAt ?? other.requestedAt ?? other.canceledAt;
    } else if (other is Note) {
      b = other.createdAt;
    } else if (other is Notification) {
      b = other.createdAt;
    } else  if( other is Refund){
      b= other.createdAt;
    }

    return compare(confirmedAt ?? declinedAt ?? requestedAt ?? canceledAt, b);
  }
}

enum OrderEditStatus {
  confirmed,
  declined,
  requested,
  created,
  canceled,
}
