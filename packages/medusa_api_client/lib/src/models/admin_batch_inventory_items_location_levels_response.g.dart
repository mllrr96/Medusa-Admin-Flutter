// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_inventory_items_location_levels_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminBatchInventoryItemsLocationLevelsResponse
_$AdminBatchInventoryItemsLocationLevelsResponseFromJson(
  Map<String, dynamic> json,
) => _AdminBatchInventoryItemsLocationLevelsResponse(
  created: (json['created'] as List<dynamic>)
      .map((e) => InventoryLevel.fromJson(e as Map<String, dynamic>))
      .toList(),
  updated: (json['updated'] as List<dynamic>)
      .map((e) => InventoryLevel.fromJson(e as Map<String, dynamic>))
      .toList(),
  deleted: (json['deleted'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AdminBatchInventoryItemsLocationLevelsResponseToJson(
  _AdminBatchInventoryItemsLocationLevelsResponse instance,
) => <String, dynamic>{
  'created': instance.created,
  'updated': instance.updated,
  'deleted': instance.deleted,
};
