// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_order_fulfillment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseOrderFulfillmentImpl _$$BaseOrderFulfillmentImplFromJson(
  Map<String, dynamic> json,
) => _$BaseOrderFulfillmentImpl(
  id: json['id'] as String,
  locationId: json['location_id'] as String,
  packedAt: DateTime.parse(json['packed_at'] as String),
  shippedAt: DateTime.parse(json['shipped_at'] as String),
  deliveredAt: DateTime.parse(json['delivered_at'] as String),
  canceledAt: DateTime.parse(json['canceled_at'] as String),
  data: json['data'] as Map<String, dynamic>,
  providerId: json['provider_id'] as String,
  shippingOptionId: json['shipping_option_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  requiresShipping: json['requires_shipping'] as bool,
);

Map<String, dynamic> _$$BaseOrderFulfillmentImplToJson(
  _$BaseOrderFulfillmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'location_id': instance.locationId,
  'packed_at': instance.packedAt.toIso8601String(),
  'shipped_at': instance.shippedAt.toIso8601String(),
  'delivered_at': instance.deliveredAt.toIso8601String(),
  'canceled_at': instance.canceledAt.toIso8601String(),
  'data': instance.data,
  'provider_id': instance.providerId,
  'shipping_option_id': instance.shippingOptionId,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'requires_shipping': instance.requiresShipping,
};
