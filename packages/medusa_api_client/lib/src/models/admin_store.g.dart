// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminStoreImpl _$$AdminStoreImplFromJson(Map<String, dynamic> json) =>
    _$AdminStoreImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      supportedCurrencies: (json['supported_currencies'] as List<dynamic>)
          .map((e) => AdminStoreCurrency.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultSalesChannelId: json['default_sales_channel_id'] as String,
      defaultRegionId: json['default_region_id'] as String,
      defaultLocationId: json['default_location_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AdminStoreImplToJson(_$AdminStoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'supported_currencies': instance.supportedCurrencies,
      'default_sales_channel_id': instance.defaultSalesChannelId,
      'default_region_id': instance.defaultRegionId,
      'default_location_id': instance.defaultLocationId,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
