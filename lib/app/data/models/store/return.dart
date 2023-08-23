import '../common/return_item.dart';
import 'index.dart';


class Return {
  String? id;
  ReturnStatus status = ReturnStatus.requested;
  List<ReturnItem>? items;
  String? swapId;
  Swap? swap;
  String? orderId;
  Order? order;
  String? claimOrderId;
  ClaimOrder? claimOrder;
  List<ShippingMethod>? shippingMethod;
  Map<String, dynamic>? shippingData;
  int? refundAmount;
  bool? noNotification;
  String? idempotencyKey;
  DateTime? receivedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  Return({
    this.id,
    this.status = ReturnStatus.requested,
    this.items,
    this.swapId,
    this.swap,
    this.orderId,
    this.order,
    this.claimOrderId,
    this.claimOrder,
    this.shippingMethod,
    this.shippingData,
    required this.refundAmount,
    this.noNotification,
    this.idempotencyKey,
    this.receivedAt,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  Return.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = ReturnStatus.values.firstWhere(
        (e) => e.value == (json['status'] ?? ''),
        orElse: () => ReturnStatus.requested);
    if (json['items'] != null) {
      items = <ReturnItem>[];
      json['items']
          .forEach((e) => items!.add(ReturnItem.fromJson(json['items'])));
    }
    swapId = json['swap_id'];
    swap = json['swap'] != null ? Swap.fromJson(json['swap']) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    claimOrderId = json['claim_order_id'];
    claimOrder = json['claim_order'] != null
        ? ClaimOrder.fromJson(json['claim_order'])
        : null;
    if (json['shipping_method'] != null) {
      shippingMethod = <ShippingMethod>[];
      json['shipping_method'].forEach((e) => shippingMethod!
          .add(ShippingMethod.fromJson(json['shipping_method'])));
    }
    shippingData = json['shipping_data'];
    refundAmount = json['refund_amount'];
    noNotification = json['no_notification'];
    idempotencyKey = json['idempotency_key'];
    receivedAt = DateTime.tryParse(json['received_at'] ?? '');
    createdAt = DateTime.tryParse(json['received_at'] ?? '');
    updatedAt = DateTime.tryParse(json['received_at'] ?? '');
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status.value;
    json['items'] = items?.map((e) => e.toJson()).toList() ?? [];
    json['swap_id'] = swapId;
    json['swap'] = swap?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson();
    json['shipping_method'] =
        shippingMethod?.map((e) => e.toJson()).toList() ?? [];
    json['shipping_data'] = shippingData;
    json['refund_amount'] = refundAmount;
    json['no_notification'] = noNotification;
    json['idempotency_key'] = idempotencyKey;
    json['received_at'] = receivedAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum ReturnStatus {
  requested('requested'),
  received('received'),
  requiresAction('requires_action'),
  canceled('canceled');

  final String value;

  const ReturnStatus(this.value);
}
