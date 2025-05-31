// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_create_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreCreateCustomer _$StoreCreateCustomerFromJson(Map<String, dynamic> json) =>
    _StoreCreateCustomer(
      email: json['email'] as String,
      companyName: json['company_name'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$StoreCreateCustomerToJson(
  _StoreCreateCustomer instance,
) => <String, dynamic>{
  'email': instance.email,
  'company_name': instance.companyName,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'metadata': instance.metadata,
};
