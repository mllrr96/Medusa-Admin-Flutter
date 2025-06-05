// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_sales_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUpdateSalesChannelImpl _$$AdminUpdateSalesChannelImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUpdateSalesChannelImpl(
  name: json['name'] as String,
  description: json['description'] as String,
  isDisabled: json['is_disabled'] as bool,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminUpdateSalesChannelImplToJson(
  _$AdminUpdateSalesChannelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'is_disabled': instance.isDisabled,
  'metadata': instance.metadata,
};
