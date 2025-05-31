// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_list_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPriceListDeleteResponse _$AdminPriceListDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminPriceListDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'price_list',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminPriceListDeleteResponseToJson(
  _AdminPriceListDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
