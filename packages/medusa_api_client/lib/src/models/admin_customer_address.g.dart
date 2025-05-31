// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_customer_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCustomerAddress _$AdminCustomerAddressFromJson(
  Map<String, dynamic> json,
) => _AdminCustomerAddress(
  id: json['id'] as String,
  addressName: json['address_name'] as String,
  isDefaultShipping: json['is_default_shipping'] as bool,
  isDefaultBilling: json['is_default_billing'] as bool,
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
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AdminCustomerAddressToJson(
  _AdminCustomerAddress instance,
) => <String, dynamic>{
  'id': instance.id,
  'address_name': instance.addressName,
  'is_default_shipping': instance.isDefaultShipping,
  'is_default_billing': instance.isDefaultBilling,
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
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
