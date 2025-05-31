// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminFulfillmentAddress _$AdminFulfillmentAddressFromJson(
  Map<String, dynamic> json,
) => _AdminFulfillmentAddress(
  id: json['id'] as String,
  fulfillmentId: json['fulfillment_id'] as String,
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
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$AdminFulfillmentAddressToJson(
  _AdminFulfillmentAddress instance,
) => <String, dynamic>{
  'id': instance.id,
  'fulfillment_id': instance.fulfillmentId,
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
  'deleted_at': instance.deletedAt.toIso8601String(),
};
