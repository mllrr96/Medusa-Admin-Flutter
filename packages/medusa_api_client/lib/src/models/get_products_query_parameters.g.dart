// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetProductsQueryParameters _$GetProductsQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetProductsQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  priceListId: json['price_list_id'],
  q: json['q'] as String,
  status: json['status'],
  salesChannelId: json['sales_channel_id'],
  title: json['title'],
  handle: json['handle'],
  id: json['id'],
  isGiftcard: json['is_giftcard'] as bool,
  tags: json['tags'],
  typeId: json['type_id'],
  categoryId: json['category_id'],
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  collectionId: json['collection_id'],
  variants: json['variants'] as Map<String, dynamic>,
);

Map<String, dynamic> _$GetProductsQueryParametersToJson(
  _GetProductsQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'price_list_id': instance.priceListId,
  'q': instance.q,
  'status': instance.status,
  'sales_channel_id': instance.salesChannelId,
  'title': instance.title,
  'handle': instance.handle,
  'id': instance.id,
  'is_giftcard': instance.isGiftcard,
  'tags': instance.tags,
  'type_id': instance.typeId,
  'category_id': instance.categoryId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
  'collection_id': instance.collectionId,
  'variants': instance.variants,
};
