// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminReturnReason _$AdminReturnReasonFromJson(Map<String, dynamic> json) =>
    _AdminReturnReason(
      id: json['id'] as String,
      value: json['value'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AdminReturnReasonToJson(_AdminReturnReason instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'label': instance.label,
      'description': instance.description,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
