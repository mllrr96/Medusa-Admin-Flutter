// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_inventory_items_location_levels_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminBatchInventoryItemsLocationLevelsResponseImpl
_$$AdminBatchInventoryItemsLocationLevelsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminBatchInventoryItemsLocationLevelsResponseImpl(
  created: (json['created'] as List<dynamic>)
      .map((e) => InventoryLevel.fromJson(e as Map<String, dynamic>))
      .toList(),
  updated: (json['updated'] as List<dynamic>)
      .map((e) => InventoryLevel.fromJson(e as Map<String, dynamic>))
      .toList(),
  deleted: (json['deleted'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic>
_$$AdminBatchInventoryItemsLocationLevelsResponseImplToJson(
  _$AdminBatchInventoryItemsLocationLevelsResponseImpl instance,
) => <String, dynamic>{
  'created': instance.created,
  'updated': instance.updated,
  'deleted': instance.deleted,
};
