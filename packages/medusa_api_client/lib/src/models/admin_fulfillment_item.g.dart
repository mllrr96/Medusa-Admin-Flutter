// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminFulfillmentItemImpl _$$AdminFulfillmentItemImplFromJson(
  Map<String, dynamic> json,
) => _$AdminFulfillmentItemImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  sku: json['sku'] as String,
  barcode: json['barcode'] as String,
  lineItemId: json['line_item_id'] as String,
  inventoryItemId: json['inventory_item_id'] as String,
  fulfillmentId: json['fulfillment_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminFulfillmentItemImplToJson(
  _$AdminFulfillmentItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'quantity': instance.quantity,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'line_item_id': instance.lineItemId,
  'inventory_item_id': instance.inventoryItemId,
  'fulfillment_id': instance.fulfillmentId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
