// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_fulfillment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateFulfillmentImpl _$$AdminCreateFulfillmentImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreateFulfillmentImpl(
  locationId: json['location_id'] as String,
  providerId: json['provider_id'] as String,
  deliveryAddress: json['delivery_address'] as Map<String, dynamic>,
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  labels: (json['labels'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  orderId: json['order_id'] as String,
  shippingOptionId: json['shipping_option_id'] as String,
  data: json['data'] as Map<String, dynamic>,
  packedAt: DateTime.parse(json['packed_at'] as String),
  shippedAt: DateTime.parse(json['shipped_at'] as String),
  deliveredAt: DateTime.parse(json['delivered_at'] as String),
  canceledAt: DateTime.parse(json['canceled_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminCreateFulfillmentImplToJson(
  _$AdminCreateFulfillmentImpl instance,
) => <String, dynamic>{
  'location_id': instance.locationId,
  'provider_id': instance.providerId,
  'delivery_address': instance.deliveryAddress,
  'items': instance.items,
  'labels': instance.labels,
  'order_id': instance.orderId,
  'shipping_option_id': instance.shippingOptionId,
  'data': instance.data,
  'packed_at': instance.packedAt.toIso8601String(),
  'shipped_at': instance.shippedAt.toIso8601String(),
  'delivered_at': instance.deliveredAt.toIso8601String(),
  'canceled_at': instance.canceledAt.toIso8601String(),
  'metadata': instance.metadata,
};
