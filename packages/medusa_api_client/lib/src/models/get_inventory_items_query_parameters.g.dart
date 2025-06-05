// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_inventory_items_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetInventoryItemsQueryParametersImpl
_$$GetInventoryItemsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetInventoryItemsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      sku: json['sku'],
      originCountry: json['origin_country'],
      midCode: json['mid_code'],
      hsCode: json['hs_code'],
      material: json['material'],
      requiresShipping: json['requires_shipping'] as bool,
      weight: json['weight'],
      length: json['length'],
      height: json['height'],
      width: json['width'],
      locationLevels: json['location_levels'] as Map<String, dynamic>,
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GetInventoryItemsQueryParametersImplToJson(
  _$GetInventoryItemsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'sku': instance.sku,
  'origin_country': instance.originCountry,
  'mid_code': instance.midCode,
  'hs_code': instance.hsCode,
  'material': instance.material,
  'requires_shipping': instance.requiresShipping,
  'weight': instance.weight,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'location_levels': instance.locationLevels,
  r'$and': instance.and,
  r'$or': instance.or,
};
