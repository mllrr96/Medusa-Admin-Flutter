// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_product_variant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminBatchProductVariantResponseImpl
_$$AdminBatchProductVariantResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminBatchProductVariantResponseImpl(
      created: (json['created'] as List<dynamic>)
          .map((e) => AdminProductVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      updated: (json['updated'] as List<dynamic>)
          .map((e) => AdminProductVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      deleted: json['deleted'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AdminBatchProductVariantResponseImplToJson(
  _$AdminBatchProductVariantResponseImpl instance,
) => <String, dynamic>{
  'created': instance.created,
  'updated': instance.updated,
  'deleted': instance.deleted,
};
