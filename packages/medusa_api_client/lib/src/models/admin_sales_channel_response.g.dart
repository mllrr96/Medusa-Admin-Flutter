// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_sales_channel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminSalesChannelResponse _$AdminSalesChannelResponseFromJson(
  Map<String, dynamic> json,
) => _AdminSalesChannelResponse(
  salesChannel: AdminSalesChannel.fromJson(
    json['sales_channel'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminSalesChannelResponseToJson(
  _AdminSalesChannelResponse instance,
) => <String, dynamic>{'sales_channel': instance.salesChannel};
