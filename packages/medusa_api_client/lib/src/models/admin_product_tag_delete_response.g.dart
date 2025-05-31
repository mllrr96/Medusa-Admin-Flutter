// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_tag_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductTagDeleteResponse _$AdminProductTagDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductTagDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'product_tag',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminProductTagDeleteResponseToJson(
  _AdminProductTagDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
