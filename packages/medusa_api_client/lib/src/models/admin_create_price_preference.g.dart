// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_price_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreatePricePreference _$AdminCreatePricePreferenceFromJson(
  Map<String, dynamic> json,
) => _AdminCreatePricePreference(
  attribute: json['attribute'] as String,
  value: json['value'] as String,
  isTaxInclusive: json['is_tax_inclusive'] as bool,
);

Map<String, dynamic> _$AdminCreatePricePreferenceToJson(
  _AdminCreatePricePreference instance,
) => <String, dynamic>{
  'attribute': instance.attribute,
  'value': instance.value,
  'is_tax_inclusive': instance.isTaxInclusive,
};
