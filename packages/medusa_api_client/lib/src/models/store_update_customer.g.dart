// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_update_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreUpdateCustomer _$StoreUpdateCustomerFromJson(Map<String, dynamic> json) =>
    _StoreUpdateCustomer(
      companyName: json['company_name'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$StoreUpdateCustomerToJson(
  _StoreUpdateCustomer instance,
) => <String, dynamic>{
  'company_name': instance.companyName,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'metadata': instance.metadata,
};
