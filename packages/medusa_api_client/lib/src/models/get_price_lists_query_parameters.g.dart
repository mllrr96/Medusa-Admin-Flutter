// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_price_lists_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPriceListsQueryParametersImpl _$$GetPriceListsQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetPriceListsQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  q: json['q'] as String,
  id: json['id'],
  startsAt: json['starts_at'] as Map<String, dynamic>,
  endsAt: json['ends_at'] as Map<String, dynamic>,
  status: (json['status'] as List<dynamic>)
      .map((e) => $enumDecode(_$NullEnumEnumMap, e))
      .toList(),
  rulesCount: (json['rules_count'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$GetPriceListsQueryParametersImplToJson(
  _$GetPriceListsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'starts_at': instance.startsAt,
  'ends_at': instance.endsAt,
  'status': instance.status,
  'rules_count': instance.rulesCount,
  r'$and': instance.and,
  r'$or': instance.or,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
