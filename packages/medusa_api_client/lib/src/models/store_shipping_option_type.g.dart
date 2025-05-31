// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_shipping_option_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreShippingOptionType _$StoreShippingOptionTypeFromJson(
  Map<String, dynamic> json,
) => _StoreShippingOptionType(
  id: json['id'] as String,
  label: json['label'] as String,
  description: json['description'] as String,
  code: json['code'] as String,
  shippingOptionId: json['shipping_option_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$StoreShippingOptionTypeToJson(
  _StoreShippingOptionType instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'description': instance.description,
  'code': instance.code,
  'shipping_option_id': instance.shippingOptionId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
