// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_stock_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateStockLocationImpl _$$AdminCreateStockLocationImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreateStockLocationImpl(
  name: json['name'] as String,
  addressId: json['address_id'] as String,
  address: AdminUpsertStockLocationAddress.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminCreateStockLocationImplToJson(
  _$AdminCreateStockLocationImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'address_id': instance.addressId,
  'address': instance.address,
  'metadata': instance.metadata,
};
