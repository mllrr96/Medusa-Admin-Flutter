// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_return_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminOrderReturnResponseImpl _$$AdminOrderReturnResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminOrderReturnResponseImpl(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminOrderReturnResponseImplToJson(
  _$AdminOrderReturnResponseImpl instance,
) => <String, dynamic>{'order': instance.order, 'return': instance.returnAA};
