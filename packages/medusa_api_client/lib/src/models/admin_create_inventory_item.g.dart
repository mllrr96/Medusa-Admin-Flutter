// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateInventoryItem _$AdminCreateInventoryItemFromJson(
  Map<String, dynamic> json,
) => _AdminCreateInventoryItem(
  sku: json['sku'] as String,
  hsCode: json['hs_code'] as String,
  weight: (json['weight'] as num).toDouble(),
  length: (json['length'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  originCountry: json['origin_country'] as String,
  midCode: json['mid_code'] as String,
  material: json['material'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  requiresShipping: json['requires_shipping'] as bool,
  thumbnail: json['thumbnail'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminCreateInventoryItemToJson(
  _AdminCreateInventoryItem instance,
) => <String, dynamic>{
  'sku': instance.sku,
  'hs_code': instance.hsCode,
  'weight': instance.weight,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'origin_country': instance.originCountry,
  'mid_code': instance.midCode,
  'material': instance.material,
  'title': instance.title,
  'description': instance.description,
  'requires_shipping': instance.requiresShipping,
  'thumbnail': instance.thumbnail,
  'metadata': instance.metadata,
};
