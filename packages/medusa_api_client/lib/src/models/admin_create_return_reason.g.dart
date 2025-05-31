// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_return_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateReturnReason _$AdminCreateReturnReasonFromJson(
  Map<String, dynamic> json,
) => _AdminCreateReturnReason(
  value: json['value'] as String,
  label: json['label'] as String,
  description: json['description'] as String,
  parentReturnReasonId: json['parent_return_reason_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminCreateReturnReasonToJson(
  _AdminCreateReturnReason instance,
) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label,
  'description': instance.description,
  'parent_return_reason_id': instance.parentReturnReasonId,
  'metadata': instance.metadata,
};
