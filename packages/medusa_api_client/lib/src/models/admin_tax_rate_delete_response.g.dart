// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tax_rate_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTaxRateDeleteResponse _$AdminTaxRateDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminTaxRateDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'tax_rate',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminTaxRateDeleteResponseToJson(
  _AdminTaxRateDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
