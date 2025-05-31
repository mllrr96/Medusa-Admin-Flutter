// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminInventoryItem _$AdminInventoryItemFromJson(Map<String, dynamic> json) =>
    _AdminInventoryItem(
      id: json['id'] as String,
      sku: json['sku'] as String,
      originCountry: json['origin_country'] as String,
      hsCode: json['hs_code'] as String,
      requiresShipping: json['requires_shipping'] as bool,
      midCode: json['mid_code'] as String,
      material: json['material'] as String,
      weight: (json['weight'] as num).toDouble(),
      length: (json['length'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      locationLevels: (json['location_levels'] as List<dynamic>)
          .map((e) => AdminInventoryLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminInventoryItemToJson(_AdminInventoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'origin_country': instance.originCountry,
      'hs_code': instance.hsCode,
      'requires_shipping': instance.requiresShipping,
      'mid_code': instance.midCode,
      'material': instance.material,
      'weight': instance.weight,
      'length': instance.length,
      'height': instance.height,
      'width': instance.width,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'metadata': instance.metadata,
      'location_levels': instance.locationLevels,
    };
