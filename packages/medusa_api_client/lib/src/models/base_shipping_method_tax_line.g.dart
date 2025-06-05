// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_shipping_method_tax_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseShippingMethodTaxLineImpl _$$BaseShippingMethodTaxLineImplFromJson(
  Map<String, dynamic> json,
) => _$BaseShippingMethodTaxLineImpl(
  shippingMethod: json['shipping_method'] as Map<String, dynamic>,
  shippingMethodId: json['shipping_method_id'] as String,
  total: (json['total'] as num).toDouble(),
  subtotal: (json['subtotal'] as num).toDouble(),
  id: json['id'] as String,
  description: json['description'] as String,
  taxRateId: json['tax_rate_id'] as String,
  code: json['code'] as String,
  rate: (json['rate'] as num).toDouble(),
  providerId: json['provider_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$BaseShippingMethodTaxLineImplToJson(
  _$BaseShippingMethodTaxLineImpl instance,
) => <String, dynamic>{
  'shipping_method': instance.shippingMethod,
  'shipping_method_id': instance.shippingMethodId,
  'total': instance.total,
  'subtotal': instance.subtotal,
  'id': instance.id,
  'description': instance.description,
  'tax_rate_id': instance.taxRateId,
  'code': instance.code,
  'rate': instance.rate,
  'provider_id': instance.providerId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
