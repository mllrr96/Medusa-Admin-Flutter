// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductImpl _$$AdminProductImplFromJson(Map<String, dynamic> json) =>
    _$AdminProductImpl(
      collection: AdminCollection.fromJson(
        json['collection'] as Map<String, dynamic>,
      ),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => AdminProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      salesChannels: (json['sales_channels'] as List<dynamic>)
          .map((e) => AdminSalesChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => AdminProductVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: AdminProductType.fromJson(json['type'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => AdminProductTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      length: (json['length'] as num).toDouble(),
      title: json['title'] as String,
      status: $enumDecode(_$NullEnumEnumMap, json['status']),
      options: (json['options'] as List<dynamic>)
          .map((e) => AdminProductOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      id: json['id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      handle: json['handle'] as String,
      subtitle: json['subtitle'] as String,
      isGiftcard: json['is_giftcard'] as bool,
      thumbnail: json['thumbnail'] as String,
      width: (json['width'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      originCountry: json['origin_country'] as String,
      hsCode: json['hs_code'] as String,
      midCode: json['mid_code'] as String,
      material: json['material'] as String,
      collectionId: json['collection_id'] as String,
      typeId: json['type_id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => AdminProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      discountable: json['discountable'] as bool,
      externalId: json['external_id'] as String,
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      shippingProfile: AdminShippingProfile.fromJson(
        json['shipping_profile'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$AdminProductImplToJson(_$AdminProductImpl instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'categories': instance.categories,
      'sales_channels': instance.salesChannels,
      'variants': instance.variants,
      'type': instance.type,
      'tags': instance.tags,
      'length': instance.length,
      'title': instance.title,
      'status': instance.status,
      'options': instance.options,
      'description': instance.description,
      'id': instance.id,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'handle': instance.handle,
      'subtitle': instance.subtitle,
      'is_giftcard': instance.isGiftcard,
      'thumbnail': instance.thumbnail,
      'width': instance.width,
      'weight': instance.weight,
      'height': instance.height,
      'origin_country': instance.originCountry,
      'hs_code': instance.hsCode,
      'mid_code': instance.midCode,
      'material': instance.material,
      'collection_id': instance.collectionId,
      'type_id': instance.typeId,
      'images': instance.images,
      'discountable': instance.discountable,
      'external_id': instance.externalId,
      'deleted_at': instance.deletedAt.toIso8601String(),
      'shipping_profile': instance.shippingProfile,
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
