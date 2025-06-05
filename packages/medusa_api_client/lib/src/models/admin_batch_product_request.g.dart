// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminBatchProductRequestImpl _$$AdminBatchProductRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AdminBatchProductRequestImpl(
  create: (json['create'] as List<dynamic>)
      .map((e) => AdminCreateProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  update: (json['update'] as List<dynamic>)
      .map((e) => AdminBatchUpdateProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  delete: (json['delete'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$AdminBatchProductRequestImplToJson(
  _$AdminBatchProductRequestImpl instance,
) => <String, dynamic>{
  'create': instance.create,
  'update': instance.update,
  'delete': instance.delete,
};
