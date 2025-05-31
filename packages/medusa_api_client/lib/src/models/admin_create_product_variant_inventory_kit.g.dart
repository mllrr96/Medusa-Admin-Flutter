// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_product_variant_inventory_kit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateProductVariantInventoryKit
_$AdminCreateProductVariantInventoryKitFromJson(Map<String, dynamic> json) =>
    _AdminCreateProductVariantInventoryKit(
      inventoryItemId: json['inventory_item_id'] as String,
      requiredQuantity: (json['required_quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$AdminCreateProductVariantInventoryKitToJson(
  _AdminCreateProductVariantInventoryKit instance,
) => <String, dynamic>{
  'inventory_item_id': instance.inventoryItemId,
  'required_quantity': instance.requiredQuantity,
};
