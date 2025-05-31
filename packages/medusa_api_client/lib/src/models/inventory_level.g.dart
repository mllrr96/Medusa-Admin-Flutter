// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryLevel _$InventoryLevelFromJson(Map<String, dynamic> json) =>
    _InventoryLevel(
      id: json['id'] as String,
      inventoryItemId: json['inventory_item_id'] as String,
      locationId: json['location_id'] as String,
      stockedQuantity: (json['stocked_quantity'] as num).toDouble(),
      reservedQuantity: (json['reserved_quantity'] as num).toDouble(),
      availableQuantity: (json['available_quantity'] as num).toDouble(),
      incomingQuantity: (json['incoming_quantity'] as num).toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$InventoryLevelToJson(_InventoryLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inventory_item_id': instance.inventoryItemId,
      'location_id': instance.locationId,
      'stocked_quantity': instance.stockedQuantity,
      'reserved_quantity': instance.reservedQuantity,
      'available_quantity': instance.availableQuantity,
      'incoming_quantity': instance.incomingQuantity,
      'metadata': instance.metadata,
    };
