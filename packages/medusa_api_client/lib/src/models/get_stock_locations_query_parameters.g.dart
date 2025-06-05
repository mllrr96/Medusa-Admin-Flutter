// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stock_locations_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetStockLocationsQueryParametersImpl
_$$GetStockLocationsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetStockLocationsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      name: json['name'],
      addressId: json['address_id'],
      salesChannelId: json['sales_channel_id'],
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GetStockLocationsQueryParametersImplToJson(
  _$GetStockLocationsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'name': instance.name,
  'address_id': instance.addressId,
  'sales_channel_id': instance.salesChannelId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
