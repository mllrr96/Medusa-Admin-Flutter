// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_batch_update_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminBatchUpdateProduct _$AdminBatchUpdateProductFromJson(
  Map<String, dynamic> json,
) => _AdminBatchUpdateProduct(
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  description: json['description'] as String,
  isGiftcard: json['is_giftcard'] as bool,
  discountable: json['discountable'] as bool,
  images: (json['images'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  thumbnail: json['thumbnail'] as String,
  handle: json['handle'] as String,
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  typeId: json['type_id'] as String,
  collectionId: json['collection_id'] as String,
  categories: (json['categories'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  options: (json['options'] as List<dynamic>)
      .map((e) => AdminUpdateProductOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  variants: (json['variants'] as List<dynamic>)
      .map(
        (e) =>
            const AdminCreateProductVariantOrAdminUpdateProductVariantUnionMapJsonConverter()
                .fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  salesChannels: (json['sales_channels'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  weight: (json['weight'] as num).toDouble(),
  length: (json['length'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  hsCode: json['hs_code'] as String,
  midCode: json['mid_code'] as String,
  originCountry: json['origin_country'] as String,
  material: json['material'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  externalId: json['external_id'] as String,
  id: json['id'] as String,
  shippingProfileId: json['shipping_profile_id'] as String,
);

Map<String, dynamic> _$AdminBatchUpdateProductToJson(
  _AdminBatchUpdateProduct instance,
) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'description': instance.description,
  'is_giftcard': instance.isGiftcard,
  'discountable': instance.discountable,
  'images': instance.images,
  'thumbnail': instance.thumbnail,
  'handle': instance.handle,
  'status': instance.status,
  'type_id': instance.typeId,
  'collection_id': instance.collectionId,
  'categories': instance.categories,
  'tags': instance.tags,
  'options': instance.options,
  'variants': instance.variants
      .map(
        const AdminCreateProductVariantOrAdminUpdateProductVariantUnionMapJsonConverter()
            .toJson,
      )
      .toList(),
  'sales_channels': instance.salesChannels,
  'weight': instance.weight,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'hs_code': instance.hsCode,
  'mid_code': instance.midCode,
  'origin_country': instance.originCountry,
  'material': instance.material,
  'metadata': instance.metadata,
  'external_id': instance.externalId,
  'id': instance.id,
  'shipping_profile_id': instance.shippingProfileId,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
