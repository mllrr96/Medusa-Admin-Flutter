import 'index.dart';

class PaymentSession {
  String? id;
  String? cartId;
  Cart? cart;
  String? providerId;
  bool isSelected = true;
  PaymentSessionStatus? status;
  Map<String, dynamic> data = {};
  String? idempotencyKey;
  DateTime? createdAt;
  DateTime? updatedAt;

  PaymentSession({
    this.id,
    required this.cartId,
    this.cart,
    required this.providerId,
    this.isSelected = true,
    required this.status,
    this.data = const {},
    this.idempotencyKey,
    this.createdAt,
    this.updatedAt,
  });

  PaymentSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    providerId = json['provider_id'];
    isSelected = json['is_selected'] ?? true;
    status = json['status'] != null
        ? PaymentSessionStatus.values
            .firstWhere((e) => e.value == json['status'])
        : null;
    data = json['data'];
    idempotencyKey = json['idempotency_key'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson() ?? {};
    json['provider_id'] = providerId;
    json['is_selected'] = isSelected;
    json['status'] = status?.value ?? '';
    json['data'] = data;
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    return json;
  }
}

enum PaymentSessionStatus {
  authorized('authorized'),
  pending('pending'),
  requiresMore('requires_more'),
  error('error'),
  canceled('canceled');

  final String value;

  const PaymentSessionStatus(this.value);
}
