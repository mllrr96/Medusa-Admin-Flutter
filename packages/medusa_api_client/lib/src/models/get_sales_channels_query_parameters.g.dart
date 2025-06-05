// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sales_channels_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSalesChannelsQueryParametersImpl
_$$GetSalesChannelsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetSalesChannelsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      name: json['name'],
      description: json['description'] as String,
      isDisabled: json['is_disabled'] as bool,
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
      locationId: json['location_id'],
      publishableKeyId: json['publishable_key_id'],
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GetSalesChannelsQueryParametersImplToJson(
  _$GetSalesChannelsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'is_disabled': instance.isDisabled,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  'location_id': instance.locationId,
  'publishable_key_id': instance.publishableKeyId,
  r'$and': instance.and,
  r'$or': instance.or,
};
