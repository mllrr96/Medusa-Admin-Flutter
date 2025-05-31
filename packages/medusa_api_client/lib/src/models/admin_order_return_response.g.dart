// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_return_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminOrderReturnResponse _$AdminOrderReturnResponseFromJson(
  Map<String, dynamic> json,
) => _AdminOrderReturnResponse(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminOrderReturnResponseToJson(
  _AdminOrderReturnResponse instance,
) => <String, dynamic>{'order': instance.order, 'return': instance.returnAA};
