// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_inventory_items_id_location_levels_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetInventoryItemsIdLocationLevelsQueryParametersImpl
_$$GetInventoryItemsIdLocationLevelsQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetInventoryItemsIdLocationLevelsQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic>
_$$GetInventoryItemsIdLocationLevelsQueryParametersImplToJson(
  _$GetInventoryItemsIdLocationLevelsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  r'$and': instance.and,
  r'$or': instance.or,
};
