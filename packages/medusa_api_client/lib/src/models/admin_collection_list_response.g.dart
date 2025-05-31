// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_collection_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCollectionListResponse _$AdminCollectionListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminCollectionListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  collections: (json['collections'] as List<dynamic>)
      .map((e) => AdminCollection.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminCollectionListResponseToJson(
  _AdminCollectionListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'collections': instance.collections,
  'estimate_count': instance.estimateCount,
};
