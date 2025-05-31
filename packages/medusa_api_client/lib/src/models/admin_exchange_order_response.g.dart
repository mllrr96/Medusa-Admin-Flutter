// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminExchangeOrderResponse _$AdminExchangeOrderResponseFromJson(
  Map<String, dynamic> json,
) => _AdminExchangeOrderResponse(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  exchange: AdminExchange.fromJson(json['exchange'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminExchangeOrderResponseToJson(
  _AdminExchangeOrderResponse instance,
) => <String, dynamic>{'order': instance.order, 'exchange': instance.exchange};
