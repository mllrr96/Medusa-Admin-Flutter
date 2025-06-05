// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_stock_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUpdateStockLocationImpl _$$AdminUpdateStockLocationImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUpdateStockLocationImpl(
  name: json['name'] as String,
  address: json['address'] as Map<String, dynamic>,
  addressId: json['address_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminUpdateStockLocationImplToJson(
  _$AdminUpdateStockLocationImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'address_id': instance.addressId,
  'metadata': instance.metadata,
};
