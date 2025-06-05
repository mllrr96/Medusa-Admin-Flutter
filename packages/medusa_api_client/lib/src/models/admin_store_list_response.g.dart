// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_store_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminStoreListResponseImpl _$$AdminStoreListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminStoreListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  stores: (json['stores'] as List<dynamic>)
      .map((e) => AdminStore.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminStoreListResponseImplToJson(
  _$AdminStoreListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'stores': instance.stores,
  'estimate_count': instance.estimateCount,
};
