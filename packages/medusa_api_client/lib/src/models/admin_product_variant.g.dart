// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductVariantImpl _$$AdminProductVariantImplFromJson(
  Map<String, dynamic> json,
) => _$AdminProductVariantImpl(
  prices: (json['prices'] as List<dynamic>)
      .map((e) => AdminPrice.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: json['id'] as String,
  title: json['title'] as String,
  sku: json['sku'] as String,
  barcode: json['barcode'] as String,
  ean: json['ean'] as String,
  upc: json['upc'] as String,
  allowBackorder: json['allow_backorder'] as bool,
  manageInventory: json['manage_inventory'] as bool,
  inventoryQuantity: (json['inventory_quantity'] as num).toDouble(),
  hsCode: json['hs_code'] as String,
  originCountry: json['origin_country'] as String,
  midCode: json['mid_code'] as String,
  material: json['material'] as String,
  weight: (json['weight'] as num).toDouble(),
  length: (json['length'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  variantRank: (json['variant_rank'] as num).toDouble(),
  options: (json['options'] as List<dynamic>)
      .map((e) => AdminProductOptionValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  product: json['product'] as Map<String, dynamic>,
  productId: json['product_id'] as String,
  calculatedPrice: BaseCalculatedPriceSet.fromJson(
    json['calculated_price'] as Map<String, dynamic>,
  ),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>,
  inventoryItems: (json['inventory_items'] as List<dynamic>)
      .map(
        (e) => AdminProductVariantInventoryItemLink.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$$AdminProductVariantImplToJson(
  _$AdminProductVariantImpl instance,
) => <String, dynamic>{
  'prices': instance.prices,
  'id': instance.id,
  'title': instance.title,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'ean': instance.ean,
  'upc': instance.upc,
  'allow_backorder': instance.allowBackorder,
  'manage_inventory': instance.manageInventory,
  'inventory_quantity': instance.inventoryQuantity,
  'hs_code': instance.hsCode,
  'origin_country': instance.originCountry,
  'mid_code': instance.midCode,
  'material': instance.material,
  'weight': instance.weight,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'variant_rank': instance.variantRank,
  'options': instance.options,
  'product': instance.product,
  'product_id': instance.productId,
  'calculated_price': instance.calculatedPrice,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
  'metadata': instance.metadata,
  'inventory_items': instance.inventoryItems,
};
