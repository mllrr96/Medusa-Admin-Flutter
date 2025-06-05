// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_variant_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductVariantDeleteResponseImpl
_$$AdminProductVariantDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminProductVariantDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      deleted: json['deleted'] as bool? ?? false,
      parent: AdminProduct.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdminProductVariantDeleteResponseImplToJson(
  _$AdminProductVariantDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
  'parent': instance.parent,
};
