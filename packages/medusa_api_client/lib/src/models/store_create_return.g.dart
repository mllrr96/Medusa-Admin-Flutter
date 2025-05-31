// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_create_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreCreateReturn _$StoreCreateReturnFromJson(Map<String, dynamic> json) =>
    _StoreCreateReturn(
      orderId: json['order_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => StoreCreateReturnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      returnShipping: StoreCreateReturnShipping.fromJson(
        json['return_shipping'] as Map<String, dynamic>,
      ),
      note: json['note'] as String,
      receiveNow: json['receive_now'] as bool,
      locationId: json['location_id'] as String,
    );

Map<String, dynamic> _$StoreCreateReturnToJson(_StoreCreateReturn instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'items': instance.items,
      'return_shipping': instance.returnShipping,
      'note': instance.note,
      'receive_now': instance.receiveNow,
      'location_id': instance.locationId,
    };
