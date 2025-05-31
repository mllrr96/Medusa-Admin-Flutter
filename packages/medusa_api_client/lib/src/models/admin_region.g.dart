// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminRegion _$AdminRegionFromJson(Map<String, dynamic> json) => _AdminRegion(
  id: json['id'] as String,
  name: json['name'] as String,
  currencyCode: json['currency_code'] as String,
  automaticTaxes: json['automatic_taxes'] as bool,
  countries: (json['countries'] as List<dynamic>)
      .map((e) => AdminRegionCountry.fromJson(e as Map<String, dynamic>))
      .toList(),
  paymentProviders: (json['payment_providers'] as List<dynamic>)
      .map((e) => AdminPaymentProvider.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AdminRegionToJson(_AdminRegion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency_code': instance.currencyCode,
      'automatic_taxes': instance.automaticTaxes,
      'countries': instance.countries,
      'payment_providers': instance.paymentProviders,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
