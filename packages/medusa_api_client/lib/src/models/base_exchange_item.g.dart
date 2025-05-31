// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_exchange_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseExchangeItem _$BaseExchangeItemFromJson(Map<String, dynamic> json) =>
    _BaseExchangeItem(
      id: json['id'] as String,
      exchangeId: json['exchange_id'] as String,
      orderId: json['order_id'] as String,
      itemId: json['item_id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BaseExchangeItemToJson(_BaseExchangeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exchange_id': instance.exchangeId,
      'order_id': instance.orderId,
      'item_id': instance.itemId,
      'quantity': instance.quantity,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
