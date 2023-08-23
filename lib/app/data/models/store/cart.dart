import 'package:medusa_admin/app/data/models/store/payment.dart';
import 'package:medusa_admin/app/data/models/store/payment_session.dart';
import 'package:medusa_admin/app/data/models/store/region.dart';
import 'package:medusa_admin/app/data/models/store/sales_channel.dart';
import 'package:medusa_admin/app/data/models/store/shipping_method.dart';

import 'address.dart';
import 'customer.dart';
import 'discount.dart';
import 'gift_card.dart';
import 'line_item.dart';

class Cart {
  String? id;
  String? email;
  String? billingAddressId;
  Address? billingAddress;
  String? shippingAddressId;
  Address? shippingAddress;
  List<LineItem>? items;
  String? regionId;
  Region? region;
  List<Discount>? discounts;
  List<GiftCard>? giftCards;
  String? customerId;
  Customer? customer;
  PaymentSession? paymentSession;
  List<PaymentSession>? paymentSessions;
  String? paymentId;
  Payment? payment;
  List<ShippingMethod>? shippingMethods;
  CartType type = CartType.defaultType;
  DateTime? completedAt;
  DateTime? paymentAuthorizedAt;
  String? idempotencyKey;
  dynamic context;
  String? salesChannelId;
  SalesChannel? salesChannel;
  int? shippingTotal;
  int? discountTotal;
  int? taxTotal;
  int? refundedTotal;
  int? total;
  int? subTotal;
  int? refundableAmount;
  int? giftCardTotal;
  int? giftCardTaxTotal;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    billingAddressId = json['billing_address_id'];
    billingAddress = json['billing_address'] != null
        ? Address.fromJson(json['billing_address'])
        : null;
    shippingAddressId = json['shipping_address_id'];
    shippingAddress = json['shipping_address'] != null
        ? Address.fromJson(json['shipping_address'])
        : null;
    if (json['items'] != null) {
      items = <LineItem>[];
      json['items'].forEach((e) => items!.add(LineItem.fromJson(e)));
    }
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;

    if (json['discounts'] != null) {
      discounts = <Discount>[];
      json['discounts'].forEach((e) => discounts!.add(Discount.fromJson(e)));
    }
    if (json['gift_cards'] != null) {
      giftCards = <GiftCard>[];
      json['gift_cards'].forEach((e) => giftCards!.add(GiftCard.fromJson(e)));
    }
    customerId = json['customer_id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    paymentSession = json['payment_session'] != null
        ? PaymentSession.fromJson(json['payment_session'])
        : null;
    if (json['payment_sessions'] != null) {
      paymentSessions = <PaymentSession>[];
      json['payment_sessions']
          .forEach((e) => paymentSessions!.add(PaymentSession.fromJson(e)));
    }
    paymentId = json['payment_id'];
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    if (json['shipping_methods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shipping_methods']
          .forEach((e) => shippingMethods!.add(ShippingMethod.fromJson(e)));
    }
    type = CartType.values.firstWhere((e) => e.value == (json['type'] ?? ''),
        orElse: () => CartType.defaultType);
    completedAt = DateTime.tryParse(json['completed_at'] ?? '');
    paymentAuthorizedAt =
        DateTime.tryParse(json['payment_authorized_at'] ?? '');
    idempotencyKey = json['idempotency_key'];
    context = json['context'];
    salesChannelId = json['sales_channel_id'];
    salesChannel = json['sales_channel'] != null
        ? SalesChannel.fromJson(json['sales_channel'] ?? '')
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
    shippingTotal = json['shipping_total'];
    discountTotal = json['discount_total'];
    taxTotal = json['tax_total'];
    refundedTotal = json['refunded_total'];
    total = json['total'];
    subTotal = json['subtotal'];
    refundableAmount = json['refundable_amount'];
    giftCardTotal = json['gift_card_total'];
    giftCardTaxTotal = json['gift_card_tax_total'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['billing_address_id'] = billingAddressId;
    json['billing_address'] = billingAddress;
    json['shipping_address_id'] = shippingAddressId;
    json['shipping_address'] = shippingAddress;
    json['items'] = items?.map((e) => e.toJson()).toList() ?? [];
    json['region_id'] = regionId;
    json['region'] = region?.toJson();
    json['discounts'] = discounts?.map((e) => e.toJson()).toList() ?? [];
    json['gift_cards'] = giftCards?.map((e) => e.toJson()).toList() ?? [];
    json['customer_id'] = customerId;
    json['customer'] = customer?.toJson();
    json['payment_session'] = paymentSession?.toJson() ;
    json['payment_sessions'] =
        paymentSessions?.map((e) => e.toJson()).toList() ?? [];
    json['payment_id'] = paymentId;
    json['payment'] = payment?.toJson() ;
    json['shipping_methods'] =
        shippingMethods?.map((e) => e.toJson()).toList();
    json['type'] = type.value;
    json['completed_at'] = completedAt.toString();
    json['payment_authorized_at'] = paymentAuthorizedAt.toString();
    json['idempotency_key'] = idempotencyKey;
    json['context'] = context;
    json['sales_channel_id'] = salesChannelId;
    json['sales_channel'] = salesChannel?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    json['shipping_total'] = shippingTotal;
    json['discount_total'] = discountTotal;
    json['tax_total'] = taxTotal;
    json['refunded_total'] = refundedTotal;
    json['total'] = total;
    json['subtotal'] = subTotal;
    json['refundable_amount'] = refundableAmount;
    json['gift_card_total'] = giftCardTotal;
    json['gift_card_tax_total'] = giftCardTaxTotal;
    return json;
  }
}

enum CartType {
  defaultType('default'),
  swap('swap'),
  draftOrder('draft_order'),
  paymentLink('payment_link'),
  claim('claim');

  final String value;

  const CartType(this.value);
}
