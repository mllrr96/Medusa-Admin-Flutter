// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_type_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductTypeDeleteResponse _$AdminProductTypeDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductTypeDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'product_type',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminProductTypeDeleteResponseToJson(
  _AdminProductTypeDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
