

import 'package:medusa_admin/app/data/models/store/swap.dart';
import 'package:medusa_admin/app/data/models/store/tracking_link.dart';

import 'claim_order.dart';
import 'fulfillment_item.dart';
import 'fulfillment_provider.dart';
import 'order.dart';

class Fulfillment {
  String? id;
  String? claimOrderId;
  ClaimOrder? claimOrder;
  String? swapId;
  Swap? swap;
  String? orderId;
  Order? order;
  String? providerId;
  FulfillmentProvider? provider;
  List<FulfillmentItem>? items;
  List<TrackingLink>? trackingLinks;
  List<String>? trackingNumbers;
  dynamic data;
  DateTime? shippedAt;
  bool? noNotification;
  DateTime? canceledAt;
  String? idempotencyKey;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  Fulfillment({
    this.id,
    this.claimOrderId,
    this.claimOrder,
    this.swapId,
    this.swap,
    this.orderId,
    this.order,
    required this.providerId,
    this.provider,
    this.items,
    this.trackingLinks,
    this.trackingNumbers,
    this.data,
    this.shippedAt,
    this.noNotification,
    this.canceledAt,
    this.idempotencyKey,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  Fulfillment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    claimOrderId = json['claim_order_id'];
    claimOrder = json['claim_order'] != null
        ? ClaimOrder.fromJson(json['claim_order'])
        : null;
    swapId = json['swap_id'];
    swap = json['swap'] != null ? Swap.fromJson(json['swap']) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    providerId = json['provider_id'];
    provider = json['provider'] != null
        ? FulfillmentProvider.fromJson(json['provider'])
        : null;
    if (json['items'] != null) {
      items = <FulfillmentItem>[];
      json['items'].forEach((e) => items!.add(FulfillmentItem.fromJson(e)));
    }

    if (json['tracking_links'] != null) {
      trackingLinks = <TrackingLink>[];
      json['tracking_links']
          .forEach((e) => trackingLinks!.add(TrackingLink.fromJson(e)));
    }
    if (json['tracking_numbers'] != null) {
      trackingNumbers = <String>[];
      json['tracking_numbers'].forEach((e) => trackingLinks!.add(e));
    }
    data = json['data'] ?? <String, dynamic>{};
    shippedAt = DateTime.tryParse(json['shipped_at'] ?? '');
    noNotification = json['no_notification'];
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '');
    idempotencyKey = json['idempotency_key'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson() ?? {};
    json['swap_id'] = swapId;
    json['swap'] = swap?.toJson() ?? {};
    json['order_id'] = orderId;
    json['order'] = order?.toJson() ?? {};
    json['provider_id'] = providerId;
    json['provider'] = provider?.toJson() ?? {};
    json['items'] = items?.map((e) => e.toJson()).toList() ?? [];
    json['tracking_links'] =
        trackingLinks?.map((e) => e.toJson()).toList() ?? [];
    json['tracking_numbers'] = trackingNumbers?.map((e) => e).toList() ?? [];
    json['data'] = data ?? {};
    json['shipped_at'] = shippedAt.toString();
    json['no_notification'] = noNotification;
    json['canceled_at'] = canceledAt.toString();
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
