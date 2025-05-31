// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_category_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductCategoryDeleteResponse
_$AdminProductCategoryDeleteResponseFromJson(Map<String, dynamic> json) =>
    _AdminProductCategoryDeleteResponse(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'product_category',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$AdminProductCategoryDeleteResponseToJson(
  _AdminProductCategoryDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
