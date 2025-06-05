// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_sales_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminSalesChannelImpl _$$AdminSalesChannelImplFromJson(
  Map<String, dynamic> json,
) => _$AdminSalesChannelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  isDisabled: json['is_disabled'] as bool,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminSalesChannelImplToJson(
  _$AdminSalesChannelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'is_disabled': instance.isDisabled,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
