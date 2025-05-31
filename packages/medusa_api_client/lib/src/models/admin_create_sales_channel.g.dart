// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_sales_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateSalesChannel _$AdminCreateSalesChannelFromJson(
  Map<String, dynamic> json,
) => _AdminCreateSalesChannel(
  name: json['name'] as String,
  description: json['description'] as String,
  isDisabled: json['is_disabled'] as bool,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminCreateSalesChannelToJson(
  _AdminCreateSalesChannel instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'is_disabled': instance.isDisabled,
  'metadata': instance.metadata,
};
