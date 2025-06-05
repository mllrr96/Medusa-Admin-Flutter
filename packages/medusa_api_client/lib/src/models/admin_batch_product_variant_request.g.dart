// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_product_variant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminBatchProductVariantRequestImpl
_$$AdminBatchProductVariantRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AdminBatchProductVariantRequestImpl(
  create: (json['create'] as List<dynamic>)
      .map((e) => AdminCreateProductVariant.fromJson(e as Map<String, dynamic>))
      .toList(),
  update: (json['update'] as List<dynamic>)
      .map(
        (e) =>
            AdminBatchUpdateProductVariant.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  delete: (json['delete'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$AdminBatchProductVariantRequestImplToJson(
  _$AdminBatchProductVariantRequestImpl instance,
) => <String, dynamic>{
  'create': instance.create,
  'update': instance.update,
  'delete': instance.delete,
};
