// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminBatchProductRequest _$AdminBatchProductRequestFromJson(
  Map<String, dynamic> json,
) => _AdminBatchProductRequest(
  create: (json['create'] as List<dynamic>)
      .map((e) => AdminCreateProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  update: (json['update'] as List<dynamic>)
      .map((e) => AdminBatchUpdateProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  delete: (json['delete'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AdminBatchProductRequestToJson(
  _AdminBatchProductRequest instance,
) => <String, dynamic>{
  'create': instance.create,
  'update': instance.update,
  'delete': instance.delete,
};
