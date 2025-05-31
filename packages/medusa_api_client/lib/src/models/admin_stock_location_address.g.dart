// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_stock_location_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminStockLocationAddress _$AdminStockLocationAddressFromJson(
  Map<String, dynamic> json,
) => _AdminStockLocationAddress(
  id: json['id'] as String,
  address1: json['address_1'] as String,
  address2: json['address_2'] as String,
  company: json['company'] as String,
  countryCode: json['country_code'] as String,
  city: json['city'] as String,
  phone: json['phone'] as String,
  postalCode: json['postal_code'] as String,
  province: json['province'] as String,
);

Map<String, dynamic> _$AdminStockLocationAddressToJson(
  _AdminStockLocationAddress instance,
) => <String, dynamic>{
  'id': instance.id,
  'address_1': instance.address1,
  'address_2': instance.address2,
  'company': instance.company,
  'country_code': instance.countryCode,
  'city': instance.city,
  'phone': instance.phone,
  'postal_code': instance.postalCode,
  'province': instance.province,
};
