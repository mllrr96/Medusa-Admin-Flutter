// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tax_rate_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminTaxRateDeleteResponseImpl _$$AdminTaxRateDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminTaxRateDeleteResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'tax_rate',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminTaxRateDeleteResponseImplToJson(
  _$AdminTaxRateDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
