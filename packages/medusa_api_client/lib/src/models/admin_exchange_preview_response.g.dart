// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminExchangePreviewResponseImpl _$$AdminExchangePreviewResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminExchangePreviewResponseImpl(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  exchange: AdminExchange.fromJson(json['exchange'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminExchangePreviewResponseImplToJson(
  _$AdminExchangePreviewResponseImpl instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'exchange': instance.exchange,
};
