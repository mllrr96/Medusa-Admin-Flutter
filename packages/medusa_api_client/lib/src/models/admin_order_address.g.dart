// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminOrderAddressImpl _$$AdminOrderAddressImplFromJson(
  Map<String, dynamic> json,
) => _$AdminOrderAddressImpl(
  id: json['id'] as String?,
  customerId: json['customer_id'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  phone: json['phone'] as String?,
  company: json['company'] as String?,
  address1: json['address_1'] as String?,
  address2: json['address_2'] as String?,
  city: json['city'] as String?,
  countryCode: json['country_code'] as String?,
  country: json['country'] == null
      ? null
      : AdminRegionCountry.fromJson(json['country'] as Map<String, dynamic>),
  province: json['province'] as String?,
  postalCode: json['postal_code'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$AdminOrderAddressImplToJson(
  _$AdminOrderAddressImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'company': instance.company,
  'address_1': instance.address1,
  'address_2': instance.address2,
  'city': instance.city,
  'country_code': instance.countryCode,
  'country': instance.country,
  'province': instance.province,
  'postal_code': instance.postalCode,
  'metadata': instance.metadata,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
