// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminExchangePreviewResponse _$AdminExchangePreviewResponseFromJson(
  Map<String, dynamic> json,
) => _AdminExchangePreviewResponse(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  exchange: AdminExchange.fromJson(json['exchange'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminExchangePreviewResponseToJson(
  _AdminExchangePreviewResponse instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'exchange': instance.exchange,
};
