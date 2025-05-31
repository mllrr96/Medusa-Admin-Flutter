// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_order_line_item_adjustment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseOrderLineItemAdjustment _$BaseOrderLineItemAdjustmentFromJson(
  Map<String, dynamic> json,
) => _BaseOrderLineItemAdjustment(
  item: json['item'] as Map<String, dynamic>,
  itemId: json['item_id'] as String,
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

Map<String, dynamic> _$BaseOrderLineItemAdjustmentToJson(
  _BaseOrderLineItemAdjustment instance,
) => <String, dynamic>{
  'item': instance.item,
  'item_id': instance.itemId,
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
