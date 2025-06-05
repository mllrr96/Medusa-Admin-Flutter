// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_price_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreatePricePreferenceImpl _$$AdminCreatePricePreferenceImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreatePricePreferenceImpl(
  attribute: json['attribute'] as String,
  value: json['value'] as String,
  isTaxInclusive: json['is_tax_inclusive'] as bool,
);

Map<String, dynamic> _$$AdminCreatePricePreferenceImplToJson(
  _$AdminCreatePricePreferenceImpl instance,
) => <String, dynamic>{
  'attribute': instance.attribute,
  'value': instance.value,
  'is_tax_inclusive': instance.isTaxInclusive,
};
