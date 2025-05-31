// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_return_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateReturnReason _$AdminUpdateReturnReasonFromJson(
  Map<String, dynamic> json,
) => _AdminUpdateReturnReason(
  label: json['label'] as String,
  value: json['value'] as String,
  description: json['description'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminUpdateReturnReasonToJson(
  _AdminUpdateReturnReason instance,
) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
  'description': instance.description,
  'metadata': instance.metadata,
};
