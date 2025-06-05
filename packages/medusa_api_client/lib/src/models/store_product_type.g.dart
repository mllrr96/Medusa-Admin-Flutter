// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductTypeImpl _$$StoreProductTypeImplFromJson(
  Map<String, dynamic> json,
) => _$StoreProductTypeImpl(
  id: json['id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
  value: json['value'] as String,
);

Map<String, dynamic> _$$StoreProductTypeImplToJson(
  _$StoreProductTypeImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
  'value': instance.value,
};
