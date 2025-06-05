// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductImageImpl _$$StoreProductImageImplFromJson(
  Map<String, dynamic> json,
) => _$StoreProductImageImpl(
  id: json['id'] as String,
  url: json['url'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>,
  rank: (json['rank'] as num).toDouble(),
);

Map<String, dynamic> _$$StoreProductImageImplToJson(
  _$StoreProductImageImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
  'metadata': instance.metadata,
  'rank': instance.rank,
};
