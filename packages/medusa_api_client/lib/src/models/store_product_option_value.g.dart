// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_option_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductOptionValueImpl _$$StoreProductOptionValueImplFromJson(
  Map<String, dynamic> json,
) => _$StoreProductOptionValueImpl(
  id: json['id'] as String,
  value: json['value'] as String,
  option: json['option'] as Map<String, dynamic>,
  optionId: json['option_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$StoreProductOptionValueImplToJson(
  _$StoreProductOptionValueImpl instance,
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
