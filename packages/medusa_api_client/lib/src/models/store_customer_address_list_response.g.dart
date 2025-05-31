// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_customer_address_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreCustomerAddressListResponse _$StoreCustomerAddressListResponseFromJson(
  Map<String, dynamic> json,
) => _StoreCustomerAddressListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  addresses: (json['addresses'] as List<dynamic>)
      .map((e) => StoreCustomerAddress.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$StoreCustomerAddressListResponseToJson(
  _StoreCustomerAddressListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'addresses': instance.addresses,
  'estimate_count': instance.estimateCount,
};
