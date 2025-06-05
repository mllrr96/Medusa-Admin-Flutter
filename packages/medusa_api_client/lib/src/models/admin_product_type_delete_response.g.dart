// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_type_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductTypeDeleteResponseImpl
_$$AdminProductTypeDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminProductTypeDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'product_type',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminProductTypeDeleteResponseImplToJson(
  _$AdminProductTypeDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
