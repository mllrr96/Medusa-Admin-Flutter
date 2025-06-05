// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_variant_inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateVariantInventoryItemImpl
_$$AdminCreateVariantInventoryItemImplFromJson(Map<String, dynamic> json) =>
    _$AdminCreateVariantInventoryItemImpl(
      requiredQuantity: (json['required_quantity'] as num).toDouble(),
      inventoryItemId: json['inventory_item_id'] as String,
    );

Map<String, dynamic> _$$AdminCreateVariantInventoryItemImplToJson(
  _$AdminCreateVariantInventoryItemImpl instance,
) => <String, dynamic>{
  'required_quantity': instance.requiredQuantity,
  'inventory_item_id': instance.inventoryItemId,
};
