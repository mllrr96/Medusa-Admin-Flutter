
import 'index.dart';

class Payment {
  String? id;
  String? swapId;
  Swap? swap;
  String? cartId;
  Cart? cart;
  String? orderId;
  Order? order;
  int? amount;
  String? currencyCode;
  Currency? currency;
  int? amountRefunded;
  String? providerId;
  Map<String, dynamic>? data;
  String? idempotencyKey;
  DateTime? capturedAt;
  DateTime? canceledAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  Payment({
    this.id,
    this.swapId,
    this.swap,
    this.cartId,
    this.cart,
    this.orderId,
    this.order,
    required this.amount,
    required this.currencyCode,
    this.currency,
    this.amountRefunded,
    required this.providerId,
    this.data,
    this.idempotencyKey,
    this.capturedAt,
    this.canceledAt,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    swapId = json['swap_id'];
    swap = json['swap'] != null ? Swap.fromJson(json['swap']) : null;
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    amount = json['amount'];
    currencyCode = json['currency_code'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    amountRefunded = json['amount_refunded'];
    providerId = json['provider_id'];
    data = json['data'] ?? {};
    idempotencyKey = json['idempotency_key'];
    capturedAt = DateTime.tryParse(json['captured_at'] ?? '')?.toLocal();
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal();
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['swap_id'] = swapId;
    json['swap'] = swap?.toJson() ?? {};
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson() ?? {};
    json['order_id'] = orderId;
    json['order'] = order?.toJson() ?? {};
    json['amount'] = amount;
    json['currency_code'] = currencyCode;
    json['currency'] = currency?.toJson() ?? {};
    json['amount_refunded'] = amountRefunded;
    json['provider_id'] = providerId;
    json['data'] = data;
    json['idempotency_key'] = idempotencyKey;
    json['captured_at'] = capturedAt.toString();
    json['canceled_at'] = canceledAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
