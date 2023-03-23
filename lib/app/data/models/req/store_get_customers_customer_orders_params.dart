

import 'package:medusa_admin/app/data/models/store/index.dart';

class StoreGetCustomersCustomerOrdersParams {
  String? id;
  String? q;
  OrderStatus status = OrderStatus.pending;
  FulfillmentStatus fulfillmentStatus = FulfillmentStatus.notFulfilled;
  PaymentStatus paymentStatus = PaymentStatus.notPaid;
  String? displayId;
  String? cartId;
  String? email;
  String? regionId;
  String? currencyCode;
  String? taxRate;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? canceledAt;

  StoreGetCustomersCustomerOrdersParams({
    this.id,
    this.q,
    this.status = OrderStatus.pending,
    this.fulfillmentStatus = FulfillmentStatus.notFulfilled,
    this.paymentStatus = PaymentStatus.notPaid,
    this.displayId,
    this.cartId,
    this.email,
    this.regionId,
    this.currencyCode,
    this.taxRate,
    this.createdAt,
    this.updatedAt,
    this.canceledAt,
  });

  StoreGetCustomersCustomerOrdersParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    q = json['q'];
    status = OrderStatus.values.firstWhere(
        (e) => e.value == (json['status'] ?? ''),
        orElse: () => OrderStatus.pending);
    fulfillmentStatus = FulfillmentStatus.values.firstWhere(
        (e) => e.value == (json['fulfillment_status'] ?? ''),
        orElse: () => FulfillmentStatus.notFulfilled);
    paymentStatus = PaymentStatus.values.firstWhere(
        (e) => e.value == (json['payment_status'] ?? ''),
        orElse: () => PaymentStatus.notPaid);
    displayId = json['display_id'];
    cartId = json['cart_id'];
    email = json['email'];
    regionId = json['region_id'];
    currencyCode = json['currency_code'];
    taxRate = json['tax_rate'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['q'] = q;
    data['status'] = status.value;
    data['fulfillment_status'] = fulfillmentStatus.value;
    data['payment_status'] = paymentStatus.value;
    data['display_id'] = displayId;
    data['cart_id'] = cartId;
    data['email'] = email;
    data['region_id'] = regionId;
    data['currency_code'] = currencyCode;
    data['tax_rate'] = taxRate;
    data['created_at'] = createdAt.toString();
    data['updated_at'] = updatedAt.toString();
    data['canceled_at'] = canceledAt.toString();
    return data;
  }
}
