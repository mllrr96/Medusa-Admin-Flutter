// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPricePreference _$AdminPricePreferenceFromJson(
  Map<String, dynamic> json,
) => _AdminPricePreference(
  id: json['id'] as String,
  attribute: json['attribute'] as String,
  value: json['value'] as String,
  isTaxInclusive: json['is_tax_inclusive'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$AdminPricePreferenceToJson(
  _AdminPricePreference instance,
) => <String, dynamic>{
  'id': instance.id,
  'attribute': instance.attribute,
  'value': instance.value,
  'is_tax_inclusive': instance.isTaxInclusive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
