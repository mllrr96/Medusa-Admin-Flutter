// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminExchangeRequestResponseImpl _$$AdminExchangeRequestResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminExchangeRequestResponseImpl(
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  exchange: AdminExchange.fromJson(json['exchange'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminExchangeRequestResponseImplToJson(
  _$AdminExchangeRequestResponseImpl instance,
) => <String, dynamic>{
  'return': instance.returnAA,
  'order_preview': instance.orderPreview,
  'exchange': instance.exchange,
};
