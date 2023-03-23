import 'index.dart';

class Swap {
  String? id;
  SwapFulfillmentStatus? fulfillmentStatus;
  SwapPaymentStatus? paymentStatus;
  String? orderId;
  Order? order;
  List<LineItem>? additionalItems;
  Return? returnOrder;
  List<Fulfillment>? fulfillments;
  Payment? payment;
  int? differenceDue;
  String? shippingAddressId;
  Address? shippingAddress;
  List<ShippingMethod>? shippingMethods;
  String? cartId;
  String? cart;
  DateTime? confirmedAt;
  DateTime? canceledAt;
  bool? noNotification;
  bool? allowBackorder;
  String? idempotencyKey;
  Map<String, dynamic>? metadata;

  Swap({
    this.id,
    this.fulfillmentStatus,
    this.paymentStatus,
    this.orderId,
    this.order,
    this.additionalItems,
    this.returnOrder,
    this.fulfillments,
    this.payment,
    this.differenceDue,
    this.shippingAddressId,
    this.shippingAddress,
    this.shippingMethods,
    this.cartId,
    this.cart,
    this.confirmedAt,
    this.canceledAt,
    this.noNotification,
    this.allowBackorder,
    this.idempotencyKey,
    this.metadata,
  });

  Swap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fulfillmentStatus = SwapFulfillmentStatus.notFulfilled;
    paymentStatus = SwapPaymentStatus.notPaid;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['additional_items'] != null) {
      additionalItems = <LineItem>[];
      json['additional_items'].forEach((v) {
        additionalItems!.add(LineItem.fromJson(v));
      });
    }
    returnOrder = json['return_order'] != null
        ? Return.fromJson(json['return_order'])
        : null;
    if (json['fulfillments'] != null) {
      fulfillments = <Fulfillment>[];
      json['fulfillments'].forEach((v) {
        fulfillments!.add(Fulfillment.fromJson(v));
      });
    }
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    differenceDue = json['difference_due'];
    shippingAddressId = json['shipping_address_id'];
    shippingAddress = json['shipping_address'] != null
        ? Address.fromJson(json['shipping_address'])
        : null;
    if (json['shipping_methods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shipping_methods'].forEach((v) {
        shippingMethods!.add(ShippingMethod.fromJson(v));
      });
    }
    cartId = json['cart_id'];
    cart = json['cart'];
    confirmedAt = DateTime.tryParse(json['confirmed_at'] ?? '');
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '');
    noNotification = json['no_notification'];
    allowBackorder = json['allow_backorder'];
    idempotencyKey = json['idempotency_key'];
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fulfillment_status'] = fulfillmentStatus?.value;
    data['payment_status'] = paymentStatus?.value;
    data['order_id'] = orderId;
    data['order'] = order?.toJson() ?? {};
    if (additionalItems != null) {
      data['additional_items'] =
          additionalItems!.map((v) => v.toJson()).toList();
    }
    data['return_order'] = returnOrder?.toJson() ?? {};
    if (fulfillments != null) {
      data['fulfillments'] = fulfillments!.map((v) => v.toJson()).toList();
    }
    data['payment'] = payment?.toJson() ?? {};
    data['difference_due'] = differenceDue;
    data['shipping_address_id'] = shippingAddressId;
    data['shipping_address'] = shippingAddress?.toJson() ?? {};
    if (shippingMethods != null) {
      data['shipping_methods'] =
          shippingMethods!.map((v) => v.toJson()).toList();
    }
    data['cart_id'] = cartId;
    data['cart'] = cart;
    data['confirmed_at'] = confirmedAt.toString();
    data['canceled_at'] = canceledAt.toString();
    data['no_notification'] = noNotification;
    data['allow_backorder'] = allowBackorder;
    data['idempotency_key'] = idempotencyKey;
    data['metadata'] = metadata;
    return data;
  }
}

enum SwapFulfillmentStatus {
  notFulfilled('not_fulfilled'),
  fulfilled('fulfilled'),
  partiallyShipped('partially_shipped'),
  shipped('shipped'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  const SwapFulfillmentStatus(this.value);
}

enum SwapPaymentStatus {
  notPaid('not_paid'),
  awaiting('awaiting'),
  captured('captured'),
  confirmed('confirmed'),
  canceled('canceled'),
  differenceRefunded('difference_refunded'),
  partiallyRefunded('partially_refunded'),
  refunded('refunded'),
  requiresAction('requires_action');

  final String value;

  const SwapPaymentStatus(this.value);
}
