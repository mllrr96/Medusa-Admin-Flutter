

import 'package:medusa_admin/app/data/models/store/return.dart';
import 'package:medusa_admin/app/data/models/store/shipping_method.dart';

import 'address.dart';
import 'claim_item.dart';
import 'fulfillment.dart';
import 'line_item.dart';
import 'order.dart';

class ClaimOrder {
  String? id;
  ClaimType? type;
  ClaimPaymentStatus paymentStatus = ClaimPaymentStatus.na;
  ClaimFulfillmentStatus fulfillmentStatus =
      ClaimFulfillmentStatus.notFulfilled;
  List<ClaimItem>? claimItems;
  List<LineItem>? additionalItems;
  String? orderId;
  Order? order;
  Return? returnOrder;
  String? shippingAddressId;
  Address? shippingAddress;
  List<ShippingMethod>? shippingMethods;
  List<Fulfillment>? fulfillments;
  int? refundAmount;
  DateTime? canceledAt;
  bool? noNotification;
  String? idempotencyKey;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  ClaimOrder({
    this.id,
    required this.type,
    this.paymentStatus = ClaimPaymentStatus.na,
    this.fulfillmentStatus = ClaimFulfillmentStatus.notFulfilled,
    this.claimItems,
    this.additionalItems,
    required this.orderId,
    this.order,
    this.returnOrder,
    this.shippingAddressId,
    this.shippingAddress,
    this.shippingMethods,
    this.fulfillments,
    this.refundAmount,
    this.canceledAt,
    this.noNotification,
    this.idempotencyKey,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.metadata,
  });

  ClaimOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (ClaimType.values.any((e) => e.value == (json['type'] ?? ''))) {
      type = json['type'] != null
          ? ClaimType.values.firstWhere((e) => e.value == (json['type'] ?? ''))
          : null;
    }
    paymentStatus = ClaimPaymentStatus.values.firstWhere(
        (e) => e.value == (json['payment_status'] ?? ''),
        orElse: () => ClaimPaymentStatus.na);
    fulfillmentStatus = ClaimFulfillmentStatus.values.firstWhere(
        (e) => e.value == (json['fulfillment_status'] ?? ''),
        orElse: () => ClaimFulfillmentStatus.notFulfilled);
    if (json['claim_items'] != null) {
      claimItems = <ClaimItem>[];
      json['claim_items']
          .forEach((e) => claimItems!.add(ClaimItem.fromJson(e)));
    }
    if (json['additional_items'] != null) {
      additionalItems = <LineItem>[];
      json['additional_items']
          .forEach((e) => additionalItems!.add(LineItem.fromJson(e)));
    }
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    returnOrder = json['return_order'] != null
        ? Return.fromJson(json['return_order'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? Address.fromJson(json['shipping_address'])
        : null;
    shippingAddressId = json['shipping_address_id'];
    if (json['shipping_methods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shipping_methods']
          .forEach((e) => shippingMethods!.add(ShippingMethod.fromJson(e)));
    }
    if (json['fulfillments'] != null) {
      fulfillments = <Fulfillment>[];
      json['fulfillments']
          .forEach((e) => fulfillments!.add(Fulfillment.fromJson(e)));
    }
    refundAmount = json['refund_amount'];
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal();
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ;
    noNotification = json['no_notification'];
    idempotencyKey = json['idempotency_key'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type?.value;
    json['payment_status'] = paymentStatus.value;
    json['fulfillment_status'] = fulfillmentStatus.value;
    json['claim_items'] = claimItems?.map((e) => e.toJson()).toList() ?? [];
    json['additional_items'] =
        additionalItems?.map((e) => e.toJson()).toList() ?? [];
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['return_order'] = returnOrder?.toJson();
    json['shipping_address_id'] = shippingAddressId;
    json['shipping_address'] = shippingAddress?.toJson();
    json['shipping_methods'] =
        shippingMethods?.map((e) => e.toJson()).toList() ?? [];
    json['fulfillments'] = fulfillments?.map((e) => e.toJson()).toList() ?? [];
    json['refund_amount'] = refundAmount;
    json['no_notification'] = noNotification;
    json['idempotency_key'] = idempotencyKey;
    json['canceled_at'] = canceledAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum ClaimType {
  refund('refund'),
  replace('replace');

  final String value;

  const ClaimType(this.value);
}

enum ClaimPaymentStatus {
  na('na'),
  notRefunded('not_refunded'),
  refunded('refunded');

  final String value;

  const ClaimPaymentStatus(this.value);
}

enum ClaimFulfillmentStatus {
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

  const ClaimFulfillmentStatus(this.value);
}
