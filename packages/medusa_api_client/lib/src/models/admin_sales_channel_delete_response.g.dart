// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_sales_channel_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminSalesChannelDeleteResponseImpl
_$$AdminSalesChannelDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminSalesChannelDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'sales-channel',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminSalesChannelDeleteResponseImplToJson(
  _$AdminSalesChannelDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
