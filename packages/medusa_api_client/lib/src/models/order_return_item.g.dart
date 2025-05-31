// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_return_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderReturnItem _$OrderReturnItemFromJson(Map<String, dynamic> json) =>
    _OrderReturnItem(
      id: json['id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      receivedQuantity: (json['received_quantity'] as num).toDouble(),
      reasonId: json['reason_id'] as String,
      itemId: json['item_id'] as String,
      returnId: json['return_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      orderId: json['order_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      damagedQuantity: (json['damaged_quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderReturnItemToJson(_OrderReturnItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'received_quantity': instance.receivedQuantity,
      'reason_id': instance.reasonId,
      'item_id': instance.itemId,
      'return_id': instance.returnId,
      'metadata': instance.metadata,
      'order_id': instance.orderId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'damaged_quantity': instance.damagedQuantity,
    };
