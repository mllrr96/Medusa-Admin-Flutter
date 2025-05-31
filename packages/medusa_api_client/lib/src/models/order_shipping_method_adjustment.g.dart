// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_shipping_method_adjustment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderShippingMethodAdjustment _$OrderShippingMethodAdjustmentFromJson(
  Map<String, dynamic> json,
) => _OrderShippingMethodAdjustment(
  shippingMethod: json['shipping_method'] as Map<String, dynamic>,
  shippingMethodId: json['shipping_method_id'] as String,
  id: json['id'] as String,
  code: json['code'] as String,
  amount: (json['amount'] as num).toDouble(),
  orderId: json['order_id'] as String,
  description: json['description'] as String,
  promotionId: json['promotion_id'] as String,
  providerId: json['provider_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$OrderShippingMethodAdjustmentToJson(
  _OrderShippingMethodAdjustment instance,
) => <String, dynamic>{
  'shipping_method': instance.shippingMethod,
  'shipping_method_id': instance.shippingMethodId,
  'id': instance.id,
  'code': instance.code,
  'amount': instance.amount,
  'order_id': instance.orderId,
  'description': instance.description,
  'promotion_id': instance.promotionId,
  'provider_id': instance.providerId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
