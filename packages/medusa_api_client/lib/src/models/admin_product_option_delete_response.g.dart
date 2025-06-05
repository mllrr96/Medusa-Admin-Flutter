// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_option_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductOptionDeleteResponseImpl
_$$AdminProductOptionDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminProductOptionDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'product_option',
      deleted: json['deleted'] as bool,
      parent: AdminProduct.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdminProductOptionDeleteResponseImplToJson(
  _$AdminProductOptionDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
  'parent': instance.parent,
};
