// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminOrderItem _$AdminOrderItemFromJson(Map<String, dynamic> json) =>
    _AdminOrderItem(
      orderId: json['order_id'] as String,
      itemId: json['item_id'] as String,
      version: (json['version'] as num).toDouble(),
      history: json['history'] as Map<String, dynamic>,
      item: AdminOrderLineItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdminOrderItemToJson(_AdminOrderItem instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'item_id': instance.itemId,
      'version': instance.version,
      'history': instance.history,
      'item': instance.item,
    };
