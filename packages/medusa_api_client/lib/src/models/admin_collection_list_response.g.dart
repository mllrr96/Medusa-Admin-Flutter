// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_collection_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCollectionListResponseImpl _$$AdminCollectionListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCollectionListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  collections: (json['collections'] as List<dynamic>)
      .map((e) => AdminCollection.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminCollectionListResponseImplToJson(
  _$AdminCollectionListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'collections': instance.collections,
  'estimate_count': instance.estimateCount,
};
