// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_customer_address_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreCustomerAddressListResponseImpl
_$$StoreCustomerAddressListResponseImplFromJson(Map<String, dynamic> json) =>
    _$StoreCustomerAddressListResponseImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => StoreCustomerAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimateCount: (json['estimate_count'] as num).toDouble(),
    );

Map<String, dynamic> _$$StoreCustomerAddressListResponseImplToJson(
  _$StoreCustomerAddressListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'addresses': instance.addresses,
  'estimate_count': instance.estimateCount,
};
