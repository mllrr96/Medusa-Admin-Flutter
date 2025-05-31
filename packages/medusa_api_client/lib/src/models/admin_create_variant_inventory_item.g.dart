// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_variant_inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateVariantInventoryItem _$AdminCreateVariantInventoryItemFromJson(
  Map<String, dynamic> json,
) => _AdminCreateVariantInventoryItem(
  requiredQuantity: (json['required_quantity'] as num).toDouble(),
  inventoryItemId: json['inventory_item_id'] as String,
);

Map<String, dynamic> _$AdminCreateVariantInventoryItemToJson(
  _AdminCreateVariantInventoryItem instance,
) => <String, dynamic>{
  'required_quantity': instance.requiredQuantity,
  'inventory_item_id': instance.inventoryItemId,
};
