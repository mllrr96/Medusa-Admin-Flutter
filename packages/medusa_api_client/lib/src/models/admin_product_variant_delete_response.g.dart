// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_variant_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductVariantDeleteResponse _$AdminProductVariantDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductVariantDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String,
  deleted: json['deleted'] as bool? ?? 'variant',
  parent: AdminProduct.fromJson(json['parent'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminProductVariantDeleteResponseToJson(
  _AdminProductVariantDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
  'parent': instance.parent,
};
