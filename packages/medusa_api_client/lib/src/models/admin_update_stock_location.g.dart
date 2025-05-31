// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_stock_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateStockLocation _$AdminUpdateStockLocationFromJson(
  Map<String, dynamic> json,
) => _AdminUpdateStockLocation(
  name: json['name'] as String,
  address: json['address'] as Map<String, dynamic>,
  addressId: json['address_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminUpdateStockLocationToJson(
  _AdminUpdateStockLocation instance,
) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'address_id': instance.addressId,
  'metadata': instance.metadata,
};
