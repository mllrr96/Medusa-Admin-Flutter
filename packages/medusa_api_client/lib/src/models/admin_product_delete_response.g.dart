// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductDeleteResponse _$AdminProductDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'product',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminProductDeleteResponseToJson(
  _AdminProductDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
