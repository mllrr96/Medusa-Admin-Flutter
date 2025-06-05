// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_variant_inventory_item_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductVariantInventoryItemLinkImpl
_$$AdminProductVariantInventoryItemLinkImplFromJson(
  Map<String, dynamic> json,
) => _$AdminProductVariantInventoryItemLinkImpl(
  id: json['id'] as String,
  variantId: json['variant_id'] as String,
  variant: json['variant'] as Map<String, dynamic>,
  inventoryItemId: json['inventory_item_id'] as String,
  inventory: AdminInventoryItem.fromJson(
    json['inventory'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$AdminProductVariantInventoryItemLinkImplToJson(
  _$AdminProductVariantInventoryItemLinkImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'variant_id': instance.variantId,
  'variant': instance.variant,
  'inventory_item_id': instance.inventoryItemId,
  'inventory': instance.inventory,
};
