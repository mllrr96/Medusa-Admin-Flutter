// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_inventory_item_locations_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminBatchInventoryItemLocationsLevel
_$AdminBatchInventoryItemLocationsLevelFromJson(Map<String, dynamic> json) =>
    _AdminBatchInventoryItemLocationsLevel(
      create: (json['create'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      update: (json['update'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      delete: (json['delete'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      force: json['force'] as bool,
    );

Map<String, dynamic> _$AdminBatchInventoryItemLocationsLevelToJson(
  _AdminBatchInventoryItemLocationsLevel instance,
) => <String, dynamic>{
  'create': instance.create,
  'update': instance.update,
  'delete': instance.delete,
  'force': instance.force,
};
