// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tax_region_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTaxRegionDeleteResponse _$AdminTaxRegionDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminTaxRegionDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'tax_region',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminTaxRegionDeleteResponseToJson(
  _AdminTaxRegionDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
