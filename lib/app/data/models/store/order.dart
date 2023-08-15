import 'index.dart';

class Order {
  String? id;
  OrderStatus status = OrderStatus.pending;
  FulfillmentStatus fulfillmentStatus = FulfillmentStatus.notFulfilled;
  PaymentStatus paymentStatus = PaymentStatus.notPaid;
  int? displayId;
  String? cartId;
  Cart? cart;
  String? customerId;
  Customer? customer;
  String? email;
  String? billingAddressId;
  Address? billingAddress;
  String? shippingAddressId;
  Address? shippingAddress;
  String? regionId;
  Region? region;
  String? currencyCode;
  Currency? currency;
  num? taxRate;
  List<Discount>? discounts;
  List<GiftCard>? giftCards;
  List<ShippingMethod>? shippingMethods;
  List<Payment>? payments;
  List<Fulfillment>? fulfillments;
  List<Return>? returns;
  List<ClaimOrder>? claims;
  List<Refund>? refunds;
  List<Swap>? swaps;
  String? draftOrderId;
  DraftOrder? draftOrder;
  List<LineItem>? items;
  List<GiftCardTransaction>? giftCardTransactions;
  DateTime? canceledAt;
  bool noNotification = false;
  String? idempotencyKey;
  String? externalId;
  String? salesChannelId;
  SalesChannel? salesChannel;
  int? shippingTotal;
  int? discountTotal;
  int? taxTotal;
  int? refundedTotal;
  int? total;
  int? subTotal;
  int? paidTotal;
  int? refundableAmount;
  int? giftCardTotal;
  int? giftCardTaxTotal;

  Order({
    this.id,
    this.status = OrderStatus.pending,
    this.fulfillmentStatus = FulfillmentStatus.notFulfilled,
    this.paymentStatus = PaymentStatus.notPaid,
    this.displayId,
    this.cartId,
    this.cart,
    required this.customerId,
    this.customer,
    required this.email,
    this.billingAddressId,
    this.billingAddress,
    this.shippingAddressId,
    this.shippingAddress,
    required this.regionId,
    this.region,
    required this.currencyCode,
    this.currency,
    this.taxRate,
    this.discounts,
    this.giftCards,
    this.shippingMethods,
    this.payments,
    this.fulfillments,
    this.returns,
    this.claims,
    this.refunds,
    this.swaps,
    this.draftOrderId,
    this.draftOrder,
    this.items,
    this.giftCardTransactions,
    this.canceledAt,
    this.noNotification = false,
    this.idempotencyKey,
    this.externalId,
    this.salesChannelId,
    this.salesChannel,
    this.shippingTotal,
    this.discountTotal,
    this.taxTotal,
    this.refundedTotal,
    this.total,
    this.subTotal,
    this.paidTotal,
    this.refundableAmount,
    this.giftCardTotal,
    this.giftCardTaxTotal,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = OrderStatus.values.firstWhere((e) => e.value == (json['status'] ?? ''), orElse: () => OrderStatus.pending);
    fulfillmentStatus = FulfillmentStatus.values
        .firstWhere((e) => e.value == (json['fulfillment_status'] ?? ''), orElse: () => FulfillmentStatus.notFulfilled);
    paymentStatus = PaymentStatus.values
        .firstWhere((e) => e.value == (json['payment_status'] ?? ''), orElse: () => PaymentStatus.notPaid);
    displayId = json['display_id'];
    cartId = json['cart_id'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    customerId = json['customer_id'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    email = json['email'];
    billingAddressId = json['billing_address_id'];
    billingAddress = json['billing_address'] != null ? Address.fromJson(json['billing_address']) : null;
    shippingAddressId = json['shipping_address_id'];
    shippingAddress = json['shipping_address'] != null ? Address.fromJson(json['shipping_address']) : null;
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    currencyCode = json['currency_code'];
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    taxRate = json['tax_rate'];
    if (json['discounts'] != null) {
      discounts = <Discount>[];
      json['discounts'].forEach((e) => discounts!.add(Discount.fromJson(e)));
    }
    if (json['gift_cards'] != null) {
      giftCards = <GiftCard>[];
      json['gift_cards'].forEach((e) => giftCards!.add(GiftCard.fromJson(e)));
    }
    if (json['shipping_methods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shipping_methods'].forEach((e) => shippingMethods!.add(ShippingMethod.fromJson(e)));
    }
    if (json['fulfillments'] != null) {
      fulfillments = <Fulfillment>[];
      json['fulfillments'].forEach((e) => fulfillments!.add(Fulfillment.fromJson(e)));
    }
    if (json['returns'] != null) {
      returns = <Return>[];
      json['returns'].forEach((e) => returns!.add(Return.fromJson(e)));
    }
    if (json['claims'] != null) {
      claims = <ClaimOrder>[];
      json['claims'].forEach((e) => claims!.add(ClaimOrder.fromJson(e)));
    }
    if (json['refunds'] != null) {
      refunds = <Refund>[];
      json['refunds'].forEach((e) => refunds!.add(Refund.fromJson(e)));
    }
    if (json['swaps'] != null) {
      swaps = <Swap>[];
      json['swaps'].forEach((e) => swaps!.add(Swap.fromJson(e)));
    }
    draftOrderId = json['draft_order_id'];
    draftOrder = json['draft_order'] != null ? DraftOrder.fromJson(json['draft_order']) : null;
    if (json['items'] != null) {
      items = <LineItem>[];
      json['items'].forEach((e) => items!.add(LineItem.fromJson(e)));
    }
    if (json['gift_card_transactions'] != null) {
      giftCardTransactions = <GiftCardTransaction>[];
      json['gift_card_transactions'].forEach((e) => giftCardTransactions!.add(GiftCardTransaction.fromJson(e)));
    }
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '');
    noNotification = json['no_notification'] ?? false;
    idempotencyKey = json['idempotency_key'];
    externalId = json['external_id'];
    salesChannelId = json['sales_channel_id'];
    salesChannel = json['sales_channel'] != null ? SalesChannel.fromJson(json['sales_channel']) : null;
    shippingTotal = json['shipping_total'];
    discountTotal = json['discount_total'];
    taxTotal = json['tax_total'];
    refundedTotal = json['refunded_total'];
    total = json['total'];
    subTotal = json['subtotal'];
    paidTotal = json['paid_total'];
    refundableAmount = json['refundable_amount'];
    giftCardTotal = json['gift_card_total'];
    giftCardTaxTotal = json['gift_card_tax_total'];
    if (json['payments'] != null) {
      payments = [];
      json['payments'].forEach((e) => payments!.add(Payment.fromJson(e)));
    }
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status.value;
    json['fulfillment_status'] = fulfillmentStatus.value;
    json['payment_status'] = paymentStatus.value;
    json['display_id'] = displayId;
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson() ?? {};
    json['customer_id'] = customerId;
    json['customer'] = customer?.toJson() ?? {};
    json['email'] = email;
    json['billing_address_id'] = billingAddressId;
    json['billing_address'] = billingAddress?.toJson();
    json['shipping_address_id'] = shippingAddressId;
    json['shipping_address'] = shippingAddress?.toJson();
    json['region_id'] = regionId;
    json['region'] = region;
    json['currency_code'] = currencyCode;
    json['currency'] = currency?.toJson();
    json['tax_rate'] = taxRate;
    json['discounts'] = discounts?.map((e) => e.toJson()).toList() ?? [];
    json['gift_cards'] = giftCards?.map((e) => e.toJson()).toList() ?? [];
    json['shipping_methods'] = shippingMethods?.map((e) => e.toJson()).toList() ?? [];
    json['fulfillments'] = fulfillments?.map((e) => e.toJson()).toList() ?? [];
    json['returns'] = returns?.map((e) => e.toJson()).toList() ?? [];
    json['claims'] = claims?.map((e) => e.toJson()).toList() ?? [];
    json['refunds'] = refunds?.map((e) => e.toJson()).toList() ?? [];
    json['swaps'] = swaps?.map((e) => e.toJson()).toList() ?? [];
    json['draft_order_id'] = draftOrderId;
    json['draft_order'] = draftOrder?.toJson() ?? {};
    json['items'] = items?.map((e) => e.toJson()).toList() ?? [];
    json['gift_card_transactions'] = giftCardTransactions?.map((e) => e.toJson()).toList() ?? [];
    json['canceled_at'] = canceledAt.toString();
    json['no_notification'] = noNotification;
    json['idempotency_key'] = idempotencyKey;
    json['external_id'] = externalId;
    json['sales_channel_id'] == salesChannelId;
    json['sales_channel'] = salesChannel?.toJson() ?? {};
    json['shipping_total'] = shippingTotal;
    json['discount_total'] = discountTotal;
    json['tax_total'] = taxTotal;
    json['refunded_total'] = refundedTotal;
    json['total'] = total;
    json['subtotal'] = subTotal;
    json['paid_total'] = paidTotal;
    json['refundable_amount'] = refundableAmount;
    json['gift_card_total'] = giftCardTotal;
    json['gift_card_tax_total'] = giftCardTaxTotal;
    return json;
  }
}

enum OrderStatus {
  pending('pending'),
  completed('completed'),
  archived('archived'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  String name() {
    switch (index) {
      case 0:
        return 'Pending';

      case 1:
        return 'Completed';

      case 2:
        return 'Archived';

      case 3:
        return 'Canceled';

      case 4:
        return 'Requires Action';
      default:
        return 'Pending';
    }
  }

  const OrderStatus(this.value);
}

enum FulfillmentStatus {
  notFulfilled('not_fulfilled'),
  partiallyFulfilled('partially_fulfilled'),
  fulfilled('fulfilled'),
  partiallyShipped('partially_shipped'),
  shipped('shipped'),
  partiallyReturned('partially_returned'),
  returned('returned'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  String name() {
    switch (index) {
      case 0:
        return 'Not Fulfilled';

      case 1:
        return 'Partially Fulfilled';

      case 2:
        return 'Fulfilled';

      case 3:
        return 'Partially Shipped';

      case 4:
        return 'Shipped';

      case 5:
        return 'Partially Returned';

      case 6:
        return 'Returned';

      case 7:
        return 'Canceled';

      case 8:
        return 'Requires Action';

      default:
        return 'Not Paid';
    }
  }

  const FulfillmentStatus(this.value);
}

enum PaymentStatus {
  notPaid('not_paid'),
  awaiting('awaiting'),
  captured('captured'),
  partiallyRefunded('partially_refunded'),
  refunded('refunded'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  String name() {
    switch (index) {
      case 0:
        return 'Not Paid';

      case 1:
        return 'Awaiting';

      case 2:
        return 'Captured';

      case 3:
        return 'Partially Refunded';

      case 4:
        return 'Refunded';

      case 5:
        return 'Canceled';

      case 6:
        return 'Requires Action';

      default:
        return 'Not Paid';
    }
  }

  const PaymentStatus(this.value);
}
