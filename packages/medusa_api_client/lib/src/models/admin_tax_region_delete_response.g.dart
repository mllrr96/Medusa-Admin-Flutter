// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tax_region_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminTaxRegionDeleteResponseImpl _$$AdminTaxRegionDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminTaxRegionDeleteResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'tax_region',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminTaxRegionDeleteResponseImplToJson(
  _$AdminTaxRegionDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
