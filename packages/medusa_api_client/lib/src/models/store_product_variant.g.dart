// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductVariantImpl _$$StoreProductVariantImplFromJson(
  Map<String, dynamic> json,
) => _$StoreProductVariantImpl(
  options: (json['options'] as List<dynamic>)
      .map((e) => StoreProductOptionValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  product: json['product'] as Map<String, dynamic>,
  length: (json['length'] as num).toDouble(),
  title: json['title'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  id: json['id'] as String,
  width: (json['width'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  originCountry: json['origin_country'] as String,
  hsCode: json['hs_code'] as String,
  midCode: json['mid_code'] as String,
  material: json['material'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
  productId: json['product_id'] as String,
  sku: json['sku'] as String,
  barcode: json['barcode'] as String,
  ean: json['ean'] as String,
  upc: json['upc'] as String,
  allowBackorder: json['allow_backorder'] as bool,
  manageInventory: json['manage_inventory'] as bool,
  inventoryQuantity: (json['inventory_quantity'] as num).toDouble(),
  variantRank: (json['variant_rank'] as num).toDouble(),
  calculatedPrice: BaseCalculatedPriceSet.fromJson(
    json['calculated_price'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$StoreProductVariantImplToJson(
  _$StoreProductVariantImpl instance,
) => <String, dynamic>{
  'options': instance.options,
  'product': instance.product,
  'length': instance.length,
  'title': instance.title,
  'metadata': instance.metadata,
  'id': instance.id,
  'width': instance.width,
  'weight': instance.weight,
  'height': instance.height,
  'origin_country': instance.originCountry,
  'hs_code': instance.hsCode,
  'mid_code': instance.midCode,
  'material': instance.material,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
  'product_id': instance.productId,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'ean': instance.ean,
  'upc': instance.upc,
  'allow_backorder': instance.allowBackorder,
  'manage_inventory': instance.manageInventory,
  'inventory_quantity': instance.inventoryQuantity,
  'variant_rank': instance.variantRank,
  'calculated_price': instance.calculatedPrice,
};
