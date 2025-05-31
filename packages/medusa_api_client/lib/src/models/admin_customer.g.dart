// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCustomer _$AdminCustomerFromJson(Map<String, dynamic> json) =>
    _AdminCustomer(
      id: json['id'] as String,
      hasAccount: json['has_account'] as bool,
      groups: (json['groups'] as List<dynamic>)
          .map((e) => AdminCustomerGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String,
      defaultBillingAddressId: json['default_billing_address_id'] as String,
      defaultShippingAddressId: json['default_shipping_address_id'] as String,
      companyName: json['company_name'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => AdminCustomerAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      phone: json['phone'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      createdBy: json['created_by'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$AdminCustomerToJson(_AdminCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'has_account': instance.hasAccount,
      'groups': instance.groups,
      'email': instance.email,
      'default_billing_address_id': instance.defaultBillingAddressId,
      'default_shipping_address_id': instance.defaultShippingAddressId,
      'company_name': instance.companyName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'addresses': instance.addresses,
      'phone': instance.phone,
      'metadata': instance.metadata,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
