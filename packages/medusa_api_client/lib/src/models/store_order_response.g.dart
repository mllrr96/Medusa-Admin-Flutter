// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreOrderResponse _$StoreOrderResponseFromJson(Map<String, dynamic> json) =>
    _StoreOrderResponse(
      order: StoreOrder.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreOrderResponseToJson(_StoreOrderResponse instance) =>
    <String, dynamic>{'order': instance.order};
