// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductType _$AdminProductTypeFromJson(Map<String, dynamic> json) =>
    _AdminProductType(
      id: json['id'] as String,
      value: json['value'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminProductTypeToJson(_AdminProductType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
      'metadata': instance.metadata,
    };
