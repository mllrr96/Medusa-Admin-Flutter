// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_list_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPriceListDeleteResponseImpl _$$AdminPriceListDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPriceListDeleteResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'price_list',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminPriceListDeleteResponseImplToJson(
  _$AdminPriceListDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
