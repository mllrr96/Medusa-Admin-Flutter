// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_return_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminExchangeReturnResponseImpl _$$AdminExchangeReturnResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminExchangeReturnResponseImpl(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminExchangeReturnResponseImplToJson(
  _$AdminExchangeReturnResponseImpl instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'return': instance.returnAA,
};
