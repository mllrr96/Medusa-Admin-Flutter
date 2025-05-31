// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_customer_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreCustomerAddressResponse _$StoreCustomerAddressResponseFromJson(
  Map<String, dynamic> json,
) => _StoreCustomerAddressResponse(
  address: StoreCustomerAddress.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StoreCustomerAddressResponseToJson(
  _StoreCustomerAddressResponse instance,
) => <String, dynamic>{'address': instance.address};
