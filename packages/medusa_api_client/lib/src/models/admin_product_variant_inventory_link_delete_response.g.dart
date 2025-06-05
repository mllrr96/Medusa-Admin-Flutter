// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_variant_inventory_link_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductVariantInventoryLinkDeleteResponseImpl
_$$AdminProductVariantInventoryLinkDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminProductVariantInventoryLinkDeleteResponseImpl(
  id: AdminProductVariantInventoryLink.fromJson(
    json['id'] as Map<String, dynamic>,
  ),
  object: json['object'] as String? ?? 'variant-inventory-item-link',
  deleted: json['deleted'] as bool,
  parent: AdminProductVariant.fromJson(json['parent'] as Map<String, dynamic>),
);

Map<String, dynamic>
_$$AdminProductVariantInventoryLinkDeleteResponseImplToJson(
  _$AdminProductVariantInventoryLinkDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
  'parent': instance.parent,
};
