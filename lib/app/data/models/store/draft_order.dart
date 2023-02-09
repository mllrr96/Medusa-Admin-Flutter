
import 'cart.dart';
import 'order.dart';

class DraftOrder {
  String? id;
  DraftOrderStatus status = DraftOrderStatus.open;
  String? displayId;
  String? cartId;
  Cart? cart;
  String? orderId;
  Order? order;
  DateTime? canceledAt;
  DateTime? completedAt;
  bool? noNotificationOrder;
  String? idempotencyKey;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  DraftOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = DraftOrderStatus.values.firstWhere(
        (e) => e.value == (json['status'] ?? ''),
        orElse: () => DraftOrderStatus.open);
    displayId = json['display_id'];
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '');
    completedAt = DateTime.tryParse(json['completed_at'] ?? '');
    noNotificationOrder = json['no_notification_order'];
    idempotencyKey = json['idempotency_key'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status.value;
    json['display_id'] = displayId;
    json['cart_id'] = cartId;
    if (cart != null) {
      json['cart'] = cart?.toJson() ?? {};
    }
    json['order_id'] = orderId;
    if (order != null) {
      json['order'] = order!.toJson();
    }
    json['canceled_at'] = canceledAt.toString();
    json['completed_at'] = completedAt.toString();
    json['no_notification_order'] = noNotificationOrder;
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum DraftOrderStatus {
  open('open'),
  completed('completed');

  final String value;

  const DraftOrderStatus(this.value);
}
