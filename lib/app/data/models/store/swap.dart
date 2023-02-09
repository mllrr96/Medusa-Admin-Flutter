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
        additionalItems!.add(new LineItem.fromJson(v));
      });
    }
    returnOrder = json['return_order'] != null
        ? Return.fromJson(json['return_order'])
        : null;
    if (json['fulfillments'] != null) {
      fulfillments = <Fulfillment>[];
      json['fulfillments'].forEach((v) {
        fulfillments!.add(new Fulfillment.fromJson(v));
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
        shippingMethods!.add(new ShippingMethod.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fulfillment_status'] = fulfillmentStatus?.value;
    data['payment_status'] = paymentStatus?.value;
    data['order_id'] = this.orderId;
    data['order'] = this.order?.toJson() ?? {};
    if (this.additionalItems != null) {
      data['additional_items'] =
          this.additionalItems!.map((v) => v.toJson()).toList();
    }
    data['return_order'] = this.returnOrder?.toJson() ?? {};
    if (this.fulfillments != null) {
      data['fulfillments'] = this.fulfillments!.map((v) => v.toJson()).toList();
    }
    data['payment'] = this.payment?.toJson() ?? {};
    data['difference_due'] = this.differenceDue;
    data['shipping_address_id'] = this.shippingAddressId;
    data['shipping_address'] = this.shippingAddress?.toJson() ?? {};
    if (this.shippingMethods != null) {
      data['shipping_methods'] =
          this.shippingMethods!.map((v) => v.toJson()).toList();
    }
    data['cart_id'] = this.cartId;
    data['cart'] = this.cart;
    data['confirmed_at'] = this.confirmedAt.toString();
    data['canceled_at'] = this.canceledAt.toString();
    data['no_notification'] = this.noNotification;
    data['allow_backorder'] = this.allowBackorder;
    data['idempotency_key'] = this.idempotencyKey;
    data['metadata'] = this.metadata;
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
