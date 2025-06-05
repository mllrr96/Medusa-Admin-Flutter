// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_option_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductOptionValueImpl _$$AdminProductOptionValueImplFromJson(
  Map<String, dynamic> json,
) => _$AdminProductOptionValueImpl(
  id: json['id'] as String,
  value: json['value'] as String,
  option: AdminProductOption.fromJson(json['option'] as Map<String, dynamic>),
  optionId: json['option_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminProductOptionValueImplToJson(
  _$AdminProductOptionValueImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'option': instance.option,
  'option_id': instance.optionId,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
