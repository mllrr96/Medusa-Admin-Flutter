// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_customer_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCustomerAddressResponse _$AdminCustomerAddressResponseFromJson(
  Map<String, dynamic> json,
) => _AdminCustomerAddressResponse(
  address: AdminCustomerAddress.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminCustomerAddressResponseToJson(
  _AdminCustomerAddressResponse instance,
) => <String, dynamic>{'address': instance.address};
