// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminBatchProductResponseImpl _$$AdminBatchProductResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminBatchProductResponseImpl(
  created: (json['created'] as List<dynamic>)
      .map((e) => AdminProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  updated: (json['updated'] as List<dynamic>)
      .map((e) => AdminProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  deleted: json['deleted'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminBatchProductResponseImplToJson(
  _$AdminBatchProductResponseImpl instance,
) => <String, dynamic>{
  'created': instance.created,
  'updated': instance.updated,
  'deleted': instance.deleted,
};
