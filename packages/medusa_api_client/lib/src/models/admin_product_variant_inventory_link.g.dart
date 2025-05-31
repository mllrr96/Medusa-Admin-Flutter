// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_variant_inventory_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductVariantInventoryLink _$AdminProductVariantInventoryLinkFromJson(
  Map<String, dynamic> json,
) => _AdminProductVariantInventoryLink(
  product: json['Product'] as Map<String, dynamic>,
  inventory: json['Inventory'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminProductVariantInventoryLinkToJson(
  _AdminProductVariantInventoryLink instance,
) => <String, dynamic>{
  'Product': instance.product,
  'Inventory': instance.inventory,
};
