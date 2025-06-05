// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductDeleteResponseImpl _$$AdminProductDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminProductDeleteResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'product',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminProductDeleteResponseImplToJson(
  _$AdminProductDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
