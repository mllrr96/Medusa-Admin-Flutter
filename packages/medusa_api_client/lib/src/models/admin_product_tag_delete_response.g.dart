// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_tag_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductTagDeleteResponseImpl
_$$AdminProductTagDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminProductTagDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'product_tag',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminProductTagDeleteResponseImplToJson(
  _$AdminProductTagDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
