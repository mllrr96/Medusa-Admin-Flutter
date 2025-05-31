// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAddress _$CreateAddressFromJson(Map<String, dynamic> json) =>
    _CreateAddress(
      customerId: json['customer_id'] as String,
      company: json['company'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      address1: json['address_1'] as String,
      address2: json['address_2'] as String,
      city: json['city'] as String,
      countryCode: json['country_code'] as String,
      province: json['province'] as String,
      postalCode: json['postal_code'] as String,
      phone: json['phone'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CreateAddressToJson(_CreateAddress instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'company': instance.company,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'city': instance.city,
      'country_code': instance.countryCode,
      'province': instance.province,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'metadata': instance.metadata,
    };
