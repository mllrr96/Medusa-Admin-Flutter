// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_customer_in_group_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCustomerInGroupFiltersImpl _$$AdminCustomerInGroupFiltersImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCustomerInGroupFiltersImpl(
  id: json['id'],
  email: json['email'],
  defaultBillingAddressId: json['default_billing_address_id'],
  defaultShippingAddressId: json['default_shipping_address_id'],
  companyName: json['company_name'],
  firstName: json['first_name'],
  lastName: json['last_name'],
  createdBy: json['created_by'],
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminCustomerInGroupFiltersImplToJson(
  _$AdminCustomerInGroupFiltersImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'default_billing_address_id': instance.defaultBillingAddressId,
  'default_shipping_address_id': instance.defaultShippingAddressId,
  'company_name': instance.companyName,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'created_by': instance.createdBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};
