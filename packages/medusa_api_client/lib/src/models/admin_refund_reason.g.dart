// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_refund_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminRefundReasonImpl _$$AdminRefundReasonImplFromJson(
  Map<String, dynamic> json,
) => _$AdminRefundReasonImpl(
  id: json['id'] as String,
  label: json['label'] as String,
  description: json['description'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$AdminRefundReasonImplToJson(
  _$AdminRefundReasonImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'description': instance.description,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
