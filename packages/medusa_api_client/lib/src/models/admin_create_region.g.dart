// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateRegionImpl _$$AdminCreateRegionImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreateRegionImpl(
  name: json['name'] as String,
  currencyCode: json['currency_code'] as String,
  countries: (json['countries'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  automaticTaxes: json['automatic_taxes'] as bool,
  isTaxInclusive: json['is_tax_inclusive'] as bool,
  paymentProviders: (json['payment_providers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminCreateRegionImplToJson(
  _$AdminCreateRegionImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'currency_code': instance.currencyCode,
  'countries': instance.countries,
  'automatic_taxes': instance.automaticTaxes,
  'is_tax_inclusive': instance.isTaxInclusive,
  'payment_providers': instance.paymentProviders,
  'metadata': instance.metadata,
};
