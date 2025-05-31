// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_create_return_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreCreateReturnItem _$StoreCreateReturnItemFromJson(
  Map<String, dynamic> json,
) => _StoreCreateReturnItem(
  id: json['id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  reasonId: json['reason_id'] as String,
  note: json['note'] as String,
);

Map<String, dynamic> _$StoreCreateReturnItemToJson(
  _StoreCreateReturnItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'quantity': instance.quantity,
  'reason_id': instance.reasonId,
  'note': instance.note,
};
