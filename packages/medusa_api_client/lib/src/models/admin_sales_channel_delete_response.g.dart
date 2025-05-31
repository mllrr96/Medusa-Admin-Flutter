// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_sales_channel_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminSalesChannelDeleteResponse _$AdminSalesChannelDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminSalesChannelDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'sales-channel',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminSalesChannelDeleteResponseToJson(
  _AdminSalesChannelDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
