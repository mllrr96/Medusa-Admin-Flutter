// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminReturnItemImpl _$$AdminReturnItemImplFromJson(
  Map<String, dynamic> json,
) => _$AdminReturnItemImpl(
  id: json['id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  receivedQuantity: (json['received_quantity'] as num).toDouble(),
  damagedQuantity: (json['damaged_quantity'] as num).toDouble(),
  reasonId: json['reason_id'] as String,
  note: json['note'] as String,
  itemId: json['item_id'] as String,
  returnId: json['return_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminReturnItemImplToJson(
  _$AdminReturnItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'quantity': instance.quantity,
  'received_quantity': instance.receivedQuantity,
  'damaged_quantity': instance.damagedQuantity,
  'reason_id': instance.reasonId,
  'note': instance.note,
  'item_id': instance.itemId,
  'return_id': instance.returnId,
  'metadata': instance.metadata,
};
