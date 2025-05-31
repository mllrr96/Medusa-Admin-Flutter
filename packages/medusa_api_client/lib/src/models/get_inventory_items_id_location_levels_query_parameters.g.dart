// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_inventory_items_id_location_levels_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetInventoryItemsIdLocationLevelsQueryParameters
_$GetInventoryItemsIdLocationLevelsQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetInventoryItemsIdLocationLevelsQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$GetInventoryItemsIdLocationLevelsQueryParametersToJson(
  _GetInventoryItemsIdLocationLevelsQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  r'$and': instance.and,
  r'$or': instance.or,
};
