// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_inventory_items_location_levels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminBatchInventoryItemsLocationLevels
_$AdminBatchInventoryItemsLocationLevelsFromJson(Map<String, dynamic> json) =>
    _AdminBatchInventoryItemsLocationLevels(
      create: (json['create'] as List<dynamic>)
          .map(
            (e) => AdminBatchCreateInventoryItemsLocationLevels.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      update: (json['update'] as List<dynamic>)
          .map(
            (e) => AdminBatchUpdateInventoryItemsLocationLevels.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      delete: (json['delete'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      force: json['force'] as bool,
    );

Map<String, dynamic> _$AdminBatchInventoryItemsLocationLevelsToJson(
  _AdminBatchInventoryItemsLocationLevels instance,
) => <String, dynamic>{
  'create': instance.create,
  'update': instance.update,
  'delete': instance.delete,
  'force': instance.force,
};
