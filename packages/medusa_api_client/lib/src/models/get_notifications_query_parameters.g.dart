// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetNotificationsQueryParameters _$GetNotificationsQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetNotificationsQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  q: json['q'] as String,
  id: json['id'],
  channel: json['channel'],
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$GetNotificationsQueryParametersToJson(
  _GetNotificationsQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'channel': instance.channel,
  r'$and': instance.and,
  r'$or': instance.or,
};
