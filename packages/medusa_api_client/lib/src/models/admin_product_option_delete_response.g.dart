// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_option_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductOptionDeleteResponse _$AdminProductOptionDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductOptionDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'product_option',
  deleted: json['deleted'] as bool,
  parent: AdminProduct.fromJson(json['parent'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminProductOptionDeleteResponseToJson(
  _AdminProductOptionDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
  'parent': instance.parent,
};
