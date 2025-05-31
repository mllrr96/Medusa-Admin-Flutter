// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_order_item_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseOrderItemDetail _$BaseOrderItemDetailFromJson(Map<String, dynamic> json) =>
    _BaseOrderItemDetail(
      id: json['id'] as String,
      itemId: json['item_id'] as String,
      item: json['item'] as Map<String, dynamic>,
      quantity: (json['quantity'] as num).toDouble(),
      fulfilledQuantity: (json['fulfilled_quantity'] as num).toDouble(),
      deliveredQuantity: (json['delivered_quantity'] as num).toDouble(),
      shippedQuantity: (json['shipped_quantity'] as num).toDouble(),
      returnRequestedQuantity: (json['return_requested_quantity'] as num)
          .toDouble(),
      returnReceivedQuantity: (json['return_received_quantity'] as num)
          .toDouble(),
      returnDismissedQuantity: (json['return_dismissed_quantity'] as num)
          .toDouble(),
      writtenOffQuantity: (json['written_off_quantity'] as num).toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BaseOrderItemDetailToJson(
  _BaseOrderItemDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'item_id': instance.itemId,
  'item': instance.item,
  'quantity': instance.quantity,
  'fulfilled_quantity': instance.fulfilledQuantity,
  'delivered_quantity': instance.deliveredQuantity,
  'shipped_quantity': instance.shippedQuantity,
  'return_requested_quantity': instance.returnRequestedQuantity,
  'return_received_quantity': instance.returnReceivedQuantity,
  'return_dismissed_quantity': instance.returnDismissedQuantity,
  'written_off_quantity': instance.writtenOffQuantity,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
