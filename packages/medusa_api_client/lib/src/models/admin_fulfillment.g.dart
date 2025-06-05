// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminFulfillmentImpl _$$AdminFulfillmentImplFromJson(
  Map<String, dynamic> json,
) => _$AdminFulfillmentImpl(
  id: json['id'] as String,
  locationId: json['location_id'] as String,
  providerId: json['provider_id'] as String,
  shippingOptionId: json['shipping_option_id'] as String,
  provider: AdminFulfillmentProvider.fromJson(
    json['provider'] as Map<String, dynamic>,
  ),
  deliveryAddress: AdminFulfillmentAddress.fromJson(
    json['delivery_address'] as Map<String, dynamic>,
  ),
  items: (json['items'] as List<dynamic>)
      .map((e) => AdminFulfillmentItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  labels: (json['labels'] as List<dynamic>)
      .map((e) => AdminFulfillmentLabel.fromJson(e as Map<String, dynamic>))
      .toList(),
  packedAt: json['packed_at'] as String,
  shippedAt: json['shipped_at'] as String,
  deliveredAt: json['delivered_at'] as String,
  canceledAt: json['canceled_at'] as String,
  data: json['data'] as Map<String, dynamic>,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminFulfillmentImplToJson(
  _$AdminFulfillmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'location_id': instance.locationId,
  'provider_id': instance.providerId,
  'shipping_option_id': instance.shippingOptionId,
  'provider': instance.provider,
  'delivery_address': instance.deliveryAddress,
  'items': instance.items,
  'labels': instance.labels,
  'packed_at': instance.packedAt,
  'shipped_at': instance.shippedAt,
  'delivered_at': instance.deliveredAt,
  'canceled_at': instance.canceledAt,
  'data': instance.data,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
