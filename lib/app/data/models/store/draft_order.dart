import 'cart.dart';
import 'order.dart';

class DraftOrder {
  /// The draft order's ID
  String? id;

  /// The status of the draft order
  DraftOrderStatus? status;

  /// The draft order's display ID
  int? displayId;

  /// The ID of the cart associated with the draft order.
  ///
  /// Example: "cart_01G8ZH853Y6TFXWPG5EYE81X63"
  String? cartId;

  /// A cart object.
  ///
  /// Available if the relation cart is expanded.
  Cart? cart;

  /// The ID of the order associated with the draft order.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  String? orderId;

  /// An order object.
  ///
  /// Available if the relation order is expanded.
  Order? order;

  /// The date the draft order was canceled at.
  DateTime? canceledAt;

  /// The date the draft order was completed at.
  DateTime? completedAt;

  /// Whether to send the customer notifications regarding order updates.
  bool? noNotificationOrder;

  /// Randomly generated key used to continue the completion of the cart associated with the draft order in case of failure.
  String? idempotencyKey;

  /// The date with timezone at which the resource was created.
  DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  DateTime? updatedAt;

  /// An optional key-value map with additional details
  Map<String, dynamic>? metadata;

  DraftOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = DraftOrderStatus.values
        .firstWhere((e) => e.value == (json['status'] ?? ''), orElse: () => DraftOrderStatus.open);
    displayId = json['display_id'];
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal();
    completedAt = DateTime.tryParse(json['completed_at'] ?? '')?.toLocal();
    noNotificationOrder = json['no_notification_order'];
    idempotencyKey = json['idempotency_key'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status?.value ?? DraftOrderStatus.open;
    json['display_id'] = displayId;
    json['cart_id'] = cartId;
    if (cart != null) {
      json['cart'] = cart?.toJson() ;
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
