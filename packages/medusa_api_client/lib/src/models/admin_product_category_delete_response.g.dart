// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_category_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductCategoryDeleteResponseImpl
_$$AdminProductCategoryDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminProductCategoryDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'product_category',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminProductCategoryDeleteResponseImplToJson(
  _$AdminProductCategoryDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
