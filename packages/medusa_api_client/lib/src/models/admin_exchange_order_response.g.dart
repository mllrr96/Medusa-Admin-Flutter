// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminExchangeOrderResponseImpl _$$AdminExchangeOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminExchangeOrderResponseImpl(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  exchange: AdminExchange.fromJson(json['exchange'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminExchangeOrderResponseImplToJson(
  _$AdminExchangeOrderResponseImpl instance,
) => <String, dynamic>{'order': instance.order, 'exchange': instance.exchange};
