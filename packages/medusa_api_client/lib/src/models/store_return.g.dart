// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreReturn _$StoreReturnFromJson(Map<String, dynamic> json) => _StoreReturn(
  items: (json['items'] as List<dynamic>)
      .map((e) => StoreReturnItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  id: json['id'] as String,
  displayId: (json['display_id'] as num).toDouble(),
  createdAt: DateTime.parse(json['created_at'] as String),
  orderId: json['order_id'] as String,
  locationId: json['location_id'] as String,
  canceledAt: json['canceled_at'] as String,
  exchangeId: json['exchange_id'] as String,
  claimId: json['claim_id'] as String,
  refundAmount: (json['refund_amount'] as num).toDouble(),
  receivedAt: json['received_at'] as String,
);

Map<String, dynamic> _$StoreReturnToJson(_StoreReturn instance) =>
    <String, dynamic>{
      'items': instance.items,
      'status': instance.status,
      'id': instance.id,
      'display_id': instance.displayId,
      'created_at': instance.createdAt.toIso8601String(),
      'order_id': instance.orderId,
      'location_id': instance.locationId,
      'canceled_at': instance.canceledAt,
      'exchange_id': instance.exchangeId,
      'claim_id': instance.claimId,
      'refund_amount': instance.refundAmount,
      'received_at': instance.receivedAt,
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
