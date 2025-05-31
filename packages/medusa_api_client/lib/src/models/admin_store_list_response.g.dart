// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_store_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminStoreListResponse _$AdminStoreListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminStoreListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  stores: (json['stores'] as List<dynamic>)
      .map((e) => AdminStore.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminStoreListResponseToJson(
  _AdminStoreListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'stores': instance.stores,
  'estimate_count': instance.estimateCount,
};
