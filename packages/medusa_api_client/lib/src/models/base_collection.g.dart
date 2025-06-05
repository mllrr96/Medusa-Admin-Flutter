// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseCollectionImpl _$$BaseCollectionImplFromJson(Map<String, dynamic> json) =>
    _$BaseCollectionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      handle: json['handle'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      products: (json['products'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$BaseCollectionImplToJson(
  _$BaseCollectionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'handle': instance.handle,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
  'products': instance.products,
  'metadata': instance.metadata,
};
