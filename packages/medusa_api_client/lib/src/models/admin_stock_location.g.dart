// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_stock_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminStockLocationImpl _$$AdminStockLocationImplFromJson(
  Map<String, dynamic> json,
) => _$AdminStockLocationImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  addressId: json['address_id'] as String,
  address: AdminStockLocationAddress.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
  salesChannels: (json['sales_channels'] as List<dynamic>)
      .map((e) => AdminSalesChannel.fromJson(e as Map<String, dynamic>))
      .toList(),
  fulfillmentProviders: (json['fulfillment_providers'] as List<dynamic>)
      .map((e) => AdminFulfillmentProvider.fromJson(e as Map<String, dynamic>))
      .toList(),
  fulfillmentSets: (json['fulfillment_sets'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$AdminStockLocationImplToJson(
  _$AdminStockLocationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address_id': instance.addressId,
  'address': instance.address,
  'sales_channels': instance.salesChannels,
  'fulfillment_providers': instance.fulfillmentProviders,
  'fulfillment_sets': instance.fulfillmentSets,
};
