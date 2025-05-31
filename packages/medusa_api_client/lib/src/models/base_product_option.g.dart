// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseProductOption _$BaseProductOptionFromJson(Map<String, dynamic> json) =>
    _BaseProductOption(
      id: json['id'] as String,
      title: json['title'] as String,
      product: json['product'] as Map<String, dynamic>,
      productId: json['product_id'] as String,
      values: (json['values'] as List<dynamic>)
          .map(
            (e) => BaseProductOptionValue.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$BaseProductOptionToJson(_BaseProductOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'product': instance.product,
      'product_id': instance.productId,
      'values': instance.values,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
