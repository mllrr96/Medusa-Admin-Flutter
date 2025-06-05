// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_create_inventory_items_location_levels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminBatchCreateInventoryItemsLocationLevelsImpl
_$$AdminBatchCreateInventoryItemsLocationLevelsImplFromJson(
  Map<String, dynamic> json,
) => _$AdminBatchCreateInventoryItemsLocationLevelsImpl(
  locationId: json['location_id'] as String,
  inventoryItemId: json['inventory_item_id'] as String,
  stockedQuantity: (json['stocked_quantity'] as num).toDouble(),
  incomingQuantity: (json['incoming_quantity'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminBatchCreateInventoryItemsLocationLevelsImplToJson(
  _$AdminBatchCreateInventoryItemsLocationLevelsImpl instance,
) => <String, dynamic>{
  'location_id': instance.locationId,
  'inventory_item_id': instance.inventoryItemId,
  'stocked_quantity': instance.stockedQuantity,
  'incoming_quantity': instance.incomingQuantity,
};
