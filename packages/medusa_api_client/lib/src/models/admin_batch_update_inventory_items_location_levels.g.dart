// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_update_inventory_items_location_levels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminBatchUpdateInventoryItemsLocationLevelsImpl
_$$AdminBatchUpdateInventoryItemsLocationLevelsImplFromJson(
  Map<String, dynamic> json,
) => _$AdminBatchUpdateInventoryItemsLocationLevelsImpl(
  locationId: json['location_id'] as String,
  inventoryItemId: json['inventory_item_id'] as String,
  stockedQuantity: (json['stocked_quantity'] as num).toDouble(),
  incomingQuantity: (json['incoming_quantity'] as num).toDouble(),
  id: json['id'] as String,
);

Map<String, dynamic> _$$AdminBatchUpdateInventoryItemsLocationLevelsImplToJson(
  _$AdminBatchUpdateInventoryItemsLocationLevelsImpl instance,
) => <String, dynamic>{
  'location_id': instance.locationId,
  'inventory_item_id': instance.inventoryItemId,
  'stocked_quantity': instance.stockedQuantity,
  'incoming_quantity': instance.incomingQuantity,
  'id': instance.id,
};
